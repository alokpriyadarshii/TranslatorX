# TranslatorX

TranslatorX is a Flutter voice translation app built for face to face conversations between two people who speak different languages. It combines speech recognition, text translation, text to speech playback, and a split screen interface so both speakers can communicate more naturally in real time.

## Features

- Split screen conversation UI for two users
- Voice to text input using the microphone
- Real time translation between selected languages
- Text to speech playback for translated output
- Language picker with a wide range of locale options
- Auto play translated speech
- Adjustable font size for better readability
- English and Polish app interface localization
- Internet connectivity check with offline warning overlay
- Persistent language and user settings using Hive

## Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **State Management:** flutter_bloc / Cubit
- **Dependency Injection:** get_it + injectable
- **Local Storage:** hive + hive_flutter
- **Speech Recognition:** speech_to_text
- **Text-to-Speech:** flutter_tts
- **Translation:** translator_plus
- **Connectivity Check:** internet_connection_checker

## Project Structure

```text
lib/
├── constants/
├── features/
│   ├── home_screen/
│   ├── language_picker/
│   ├── user_settings/
│   └── voice_record/
├── utils/
│   ├── di.dart
│   └── l10n/
└── main.dart
```

## Supported Platforms

This Flutter project includes platform folders for:

- Android
- iOS
- Web
- macOS
- Linux
- Windows

## Getting Started

### Prerequisites

Make sure you have installed:

- Flutter SDK
- Dart SDK compatible with the Flutter version in use
- Chrome, Android Studio, Xcode, or another target platform/device

### Install Dependencies

```bash
flutter pub get
```

### Run on Chrome

```bash
cd ~/Desktop/TranslatorX
flutter run -d chrome
```

### Run on Another Device

```bash
flutter devices
flutter run -d <device-id>
```

## How It Works

1. Choose the source and target languages.
2. Tap the microphone for either speaker.
3. Speak into the device.
4. The app converts speech to text, translates it, and shows both the original and translated text.
5. If auto-play is enabled, the translated result is spoken aloud automatically.

## Configuration Notes

- Language preferences are stored in a Hive box named `language_box`.
- User settings are stored in a Hive box named `user_settings`.
- The app is locked to portrait orientation.
- Localization currently includes English and Polish.

## Main Packages Used

The project depends on packages such as:

- `flutter_bloc`
- `get_it`
- `injectable`
- `hive`
- `speech_to_text`
- `flutter_tts`
- `translator_plus`
- `country_flags`
- `internet_connection_checker`
- `avatar_glow`

## Notes

This archive already contains generated folders such as `build/`, `.dart_tool/`, and platform specific files. For a cleaner repository, these are usually excluded from version control unless intentionally included.
