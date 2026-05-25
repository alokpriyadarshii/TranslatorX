// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:translatorx/utils/text_to_speech_helper.dart';

void main() {
  group('TextToSpeechHelper', () {
    test('formats stored locale codes for text to speech engines.', () {
      expect(TextToSpeechHelper.formatLocale('hi_IN'), 'hi-IN');
      expect(TextToSpeechHelper.formatLocale('en_US'), 'en-US');
    });

    test('selects an exact voice locale match.', () {
      final voice = TextToSpeechHelper.selectVoiceForLocale(
        [
          {'name': 'English', 'locale': 'en-US'},
          {'name': 'Hindi', 'locale': 'hi-IN'},
        ],
        'hi-IN',
      );

      expect(voice, {'name': 'Hindi', 'locale': 'hi-IN'});
    });

    test('matches voice locales that use underscores.', () {
      final voice = TextToSpeechHelper.selectVoiceForLocale(
        [
          {'name': 'Hindi', 'locale': 'hi_IN'},
        ],
        'hi-IN',
      );

      expect(voice, {'name': 'Hindi', 'locale': 'hi_IN'});
    });

    test('falls back to the same language when region differs.', () {
      final voice = TextToSpeechHelper.selectVoiceForLocale(
        [
          {'name': 'Hindi Generic', 'locale': 'hi'},
        ],
        'hi-IN',
      );

      expect(voice, {'name': 'Hindi Generic', 'locale': 'hi'});
    });
  });
}
