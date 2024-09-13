# AI Chat App
Mobile Developer Coding Challenge: AI Chat App

**Features**:
- AI chat (text only)
- Get/Rename history chat

## Prerequisites
- Xcode 15.4+
- Android Studio Koala | 2024.1.1
- Flutter 3.24+ (install with `brew install --cask flutter` or from https://docs.flutter.dev/get-started/install/macos)
- Install Flutter and Dart extension on your IDE

## Installation
- `git clone git@github.com/ai_chat.git`
- `cd ai_chat`
- `flutter pub get`

## Development
Configure your IDE to use Dart SDK from Flutter installation. If Flutter was installed through `brew`,
path to Dart SDK will be something as `/usr/local/Caskroom/flutter/3.7.9/flutter/bin/cache/dart-sdk`
(you can find your installed Flutter directory by `ls /usr/local/Caskroom/flutter/`).

Most of the commands should be done from within `app` directory.

####  Install packages and generate localization
```sh
  flutter pub get
```

####  Generate model, retrofit api and mockito test
```sh
dart pub run build_runner build --delete-conflicting-outputs
```

####  Run unit test
```sh
flutter test
```
## Set up .env
1. Create .env file in project root folder
2. Add this line into .env file
```sh
difyApiKey=[YOUR_DIFY_API_KEY]
```






