# TranslatorX

TranslatorX is a Flutter voice translation app built for face to face conversations between two people who speak different languages. It combines speech recognition, text translation, text to speech playback, and a split screen interface so both speakers can communicate more naturally in real time.

## Preview

  <img src="images/Screenshot 2026-05-23 at 1.57.12ΓÇ»PM.png" alt="TranslatorX Preview 1" width="100%" />
  <img src="images/Screenshot 2026-05-23 at 1.57.37ΓÇ»PM.png" alt="TranslatorX Preview 2" width="100%" />
  <img src="images/Screenshot 2026-05-23 at 1.58.00ΓÇ»PM.png" alt="TranslatorX Preview 3" width="100%" />


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

| Category | Technology |
| --- | --- |
| Framework | Flutter |
| Programming Language | Dart |
| Dart SDK | >=3.1.0 <4.0.0 |
| State Management | flutter_bloc / Cubit |
| Dependency Injection | get_it, injectable |
| Local Storage | Hive, hive_flutter |
| Speech Recognition | speech_to_text |
| Text-to-Speech | flutter_tts |
| Translation | translator_plus |
| Connectivity Check | internet_connection_checker |
| Localization | Flutter Localizations, ARB, l10n.yaml |
| UI / Effects | avatar_glow, country_flags |
| Testing | flutter_test, bloc_test, mocktail |
| Code Quality | flutter_lints, analysis_options.yaml |
| Build Tools | build_runner, injectable_generator |
| App Icons | flutter_launcher_icons |
| Splash Screen | flutter_native_splash |
| Platforms | Android, iOS, Web, macOS, Linux, Windows |
| Web Deployment | Vercel |
| Package Manager | pub / pubspec.yaml |

## Project Structure

```text
TranslatorX/
├── .vscode/
├── android/
│   ├── app/
│   │   └── src/
│   │       └── main/
│   │           ├── AndroidManifest.xml
│   │           ├── kotlin/
│   │           │   └── com/
│   │           │       └── example/
│   │           │           └── translatorx/
│   │           │               └── MainActivity.kt
│   │           └── res/
│   ├── build.gradle
│   ├── gradle/
│   ├── gradle.properties
│   └── settings.gradle
├── assets/
│   ├── logo.png
│   ├── splash.png
│   └── turtle.png
├── images/
│   ├── Screenshot 2026-05-23 at 1.57.12 PM.png
│   ├── Screenshot 2026-05-23 at 1.57.37 PM.png
│   └── Screenshot 2026-05-23 at 1.58.00 PM.png
├── ios/
│   ├── Flutter/
│   ├── Runner/
│   ├── Runner.xcodeproj/
│   ├── Runner.xcworkspace/
│   ├── RunnerTests/
│   └── Podfile
├── lib/
│   ├── constants/
│   │   ├── enums.dart
│   │   └── extensions.dart
│   ├── features/
│   │   ├── home_screen/
│   │   │   ├── home_screen.dart
│   │   │   └── presentation/
│   │   │       ├── cubit/
│   │   │       └── widgets/
│   │   ├── language_picker/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── user_settings/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   └── voice_record/
│   │       └── presentation/
│   │           ├── cubits/
│   │           └── widgets/
│   ├── utils/
│   │   ├── di.dart
│   │   ├── di.config.dart
│   │   ├── l10n/
│   │   │   ├── app_en.arb
│   │   │   ├── app_pl.arb
│   │   │   ├── localization.dart
│   │   │   └── translations/
│   │   ├── text_to_speech_helper.dart
│   │   ├── web_text_to_speech_player.dart
│   │   ├── web_text_to_speech_player_stub.dart
│   │   └── web_text_to_speech_player_web.dart
│   └── main.dart
├── linux/
│   ├── CMakeLists.txt
│   ├── flutter/
│   ├── main.cc
│   ├── my_application.cc
│   └── my_application.h
├── macos/
│   ├── Flutter/
│   ├── Runner/
│   ├── Runner.xcodeproj/
│   ├── Runner.xcworkspace/
│   ├── RunnerTests/
│   ├── Podfile
│   └── Podfile.lock
├── test/
│   ├── features/
│   │   ├── language_picker/
│   │   ├── user_settings/
│   │   └── voice_record/
│   └── utils/
│       └── text_to_speech_helper_test.dart
├── web/
│   ├── favicon.png
│   ├── icons/
│   ├── index.html
│   ├── manifest.json
│   └── splash/
├── windows/
│   ├── CMakeLists.txt
│   ├── flutter/
│   └── runner/
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── l10n.yaml
├── license
├── pubspec.lock
├── pubspec.yaml
├── README.md
├── vercel-build.sh
└── vercel.json
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
5. If auto play is enabled, the translated result is spoken aloud automatically.

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
