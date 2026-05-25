// Package imports:
import 'package:flutter_tts/flutter_tts.dart';

// Project imports:
import 'package:translatorx/utils/web_text_to_speech_player.dart';

class TextToSpeechHelper {
  const TextToSpeechHelper._();

  static String formatLocale(String localeCode) {
    return localeCode.replaceAll('_', '-');
  }

  static bool shouldUseWebAudioFallback(String localeCode) {
    return formatLocale(localeCode).toLowerCase().split('-').first == 'hi';
  }

  static Future<void> speak({
    required FlutterTts flutterTts,
    required String text,
    required String localeCode,
    required double speechRate,
  }) async {
    if (text.trim().isEmpty) {
      return;
    }

    final String locale = formatLocale(localeCode);
    if (shouldUseWebAudioFallback(locale)) {
      final bool didSpeak = await playWebTextToSpeech(
        text: text,
        languageCode: locale,
        speechRate: speechRate,
      );
      if (didSpeak) {
        return;
      }
    }

    await configure(
      flutterTts: flutterTts,
      localeCode: locale,
      speechRate: speechRate,
    );
    await flutterTts.speak(text);
  }

  static Future<void> configure({
    required FlutterTts flutterTts,
    required String localeCode,
    required double speechRate,
  }) async {
    final String locale = formatLocale(localeCode);

    await flutterTts.stop();
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.setPitch(1);
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setLanguage(locale);

    final Map<String, String>? voice = selectVoiceForLocale(
      await _getVoices(flutterTts),
      locale,
    );

    if (voice != null) {
      try {
        await flutterTts.setVoice(voice);
      } catch (_) {
        // Some platforms can speak a language but do not accept explicit voices.
      }
    }
  }

  static Map<String, String>? selectVoiceForLocale(
    dynamic voices,
    String localeCode,
  ) {
    if (voices is! Iterable) {
      return null;
    }

    final List<Map<String, String>> parsedVoices = voices
        .map(_parseVoice)
        .whereType<Map<String, String>>()
        .toList(growable: false);

    final String locale = _normalizeLocale(localeCode);

    for (final voice in parsedVoices) {
      if (_normalizeLocale(voice['locale'] ?? '') == locale) {
        return voice;
      }
    }

    final String languageCode = locale.split('-').first;
    for (final voice in parsedVoices) {
      if (_normalizeLocale(voice['locale'] ?? '').split('-').first ==
          languageCode) {
        return voice;
      }
    }

    return null;
  }

  static Future<dynamic> _getVoices(FlutterTts flutterTts) async {
    for (final delay in [
      Duration.zero,
      const Duration(milliseconds: 200),
      const Duration(milliseconds: 500),
    ]) {
      if (delay != Duration.zero) {
        await Future.delayed(delay);
      }

      try {
        final dynamic voices = await flutterTts.getVoices;
        if (voices is Iterable && voices.isNotEmpty) {
          return voices;
        }
      } catch (_) {
        return const [];
      }
    }

    return const [];
  }

  static Map<String, String>? _parseVoice(dynamic voice) {
    if (voice is! Map) {
      return null;
    }

    final dynamic name = voice['name'];
    final dynamic locale = voice['locale'] ?? voice['lang'];
    if (name is! String || locale is! String) {
      return null;
    }

    return {
      'name': name,
      'locale': locale,
    };
  }

  static String _normalizeLocale(String localeCode) {
    return formatLocale(localeCode).toLowerCase();
  }
}
