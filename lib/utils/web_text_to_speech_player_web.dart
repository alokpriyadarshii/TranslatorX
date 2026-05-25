// Dart imports:
import 'dart:async';
import 'dart:html' as html;

Future<bool> playWebTextToSpeech({
  required String text,
  required String languageCode,
  required double speechRate,
}) async {
  final String trimmedText = text.trim();
  if (trimmedText.isEmpty) {
    return true;
  }

  final String language = languageCode.split('-').first;
  final Uri uri = Uri.https(
    'translate.google.com',
    '/translate_tts',
    {
      'ie': 'UTF-8',
      'client': 'tw-ob',
      'tl': language,
      'q': trimmedText,
    },
  );

  final audio = html.AudioElement(uri.toString())
    ..preload = 'auto'
    ..playbackRate = _audioPlaybackRate(speechRate);

  final completer = Completer<bool>();
  late StreamSubscription endedSubscription;
  late StreamSubscription errorSubscription;

  endedSubscription = audio.onEnded.listen((_) {
    if (!completer.isCompleted) {
      completer.complete(true);
    }
  });
  errorSubscription = audio.onError.listen((_) {
    if (!completer.isCompleted) {
      completer.complete(false);
    }
  });

  try {
    await audio.play();
    return await completer.future.timeout(
      const Duration(seconds: 30),
      onTimeout: () => true,
    );
  } catch (_) {
    return false;
  } finally {
    await endedSubscription.cancel();
    await errorSubscription.cancel();
  }
}

double _audioPlaybackRate(double speechRate) {
  if (speechRate <= 0.25) {
    return 0.75;
  }

  return 1.0;
}
