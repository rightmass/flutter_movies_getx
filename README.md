# flutter_movies_getx

## Screenshot
|Home|Detail|
|---|---|
|![Simulator Screenshot - iPhone 15 - 2024-07-17 at 10 25 14](https://github.com/user-attachments/assets/5115c35d-5718-455c-9419-c2aba02bfb37)|![Simulator Screenshot - iPhone 15 - 2024-07-21 at 01 10 48](https://github.com/user-attachments/assets/5d3373d8-dded-4e29-8123-5210d6251d10)|

## Environment
```
% flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.22.2, on macOS 14.4.1 23E224 darwin-arm64 (Rosetta), locale ko-KR)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.2)
[✓] Xcode - develop for iOS and macOS (Xcode 15.3)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2024.1)
[✓] VS Code (version 1.90.2)
[✓] Connected device (5 available)            
[✓] Network resources
```

## Package in use
```
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.6
  get: ^4.6.6
  google_fonts: ^6.2.1
  envied: ^0.5.4+1
  json_annotation: ^4.9.0
  carousel_slider: ^4.2.1
  cached_network_image: ^3.3.1

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^3.0.0
  envied_generator: ^0.5.4+1
  build_runner: ^2.4.11
  json_serializable: ^6.8.0
```

## Getting Started

This project uses the TMDB API.

Before running the app, you need to [sign up on the TMDB website](https://www.themoviedb.org/signup), then obtain an Access Token on the [settings API page](https://www.themoviedb.org/settings/api).

Once you have this, create an `.env` file **at the root of the project** and add your access token:

```dart
// .env
ACCESS_TOKEN=<Your Access Token>
```

Then, run the code generator:

```
dart run build_runner build -d
```

and run:
```
flutter run
```

----
