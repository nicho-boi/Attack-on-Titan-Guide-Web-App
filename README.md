# Attack on Titan Guide Web App

A Flutter web app for exploring the world of Attack on Titan through character profiles, Titan information, favorites, and a Scout quiz.

## About

Attack on Titan Guide Web App is a fan-made guide built with Flutter. It presents a themed interactive experience where users can browse human characters and Titans, view stats and descriptions, save favorite characters, and answer quiz questions inspired by the series.

The project is designed as a web app, but because it is built with Flutter, it can also run on other supported platforms such as Android, Windows, macOS, Linux, and iOS.

## Features

- Home page with Attack on Titan themed hero section
- Navigation bar with icon buttons and small text labels
- Character and Titan browser
- Character descriptions, images, thumbnails, and stat bars
- Favorites page powered by provider state management
- User profile page
- Scout quiz page using local JSON quiz data
- Custom images, icons, and Ditty font styling
- Responsive Flutter UI using Material components

## Tech Stack

- Flutter
- Dart
- Material Design
- Provider for state management
- Shared Preferences package
- Flutter Native Splash
- Local JSON data
- Local image and font assets

## Project Structure

```text
lib/
  main.dart
  pages/
    home_page.dart
    character_page.dart
    favorites_page.dart
    login_page.dart
    quiz_page.dart
    user_profile_page.dart
  providers/
    favorite_provider.dart
  widgets/
    navbar.dart

assets/
  images/
  quiz_data.json

fonts/
  Ditty.ttf
```

## Main Screens

- Login Page: simple entry screen for the app
- Home Page: hero image, logo, and Enter the Walls button
- Characters Page: browse humans and Titans with stats and descriptions
- Favorites Page: view saved favorite characters
- Quiz Page: answer Scout quiz questions
- Profile Page: view and edit user profile details

## Getting Started

Make sure Flutter is installed, then run:

```bash
flutter pub get
flutter run -d chrome
```

To run on another connected device or emulator:

```bash
flutter devices
flutter run
```

## Notes

This is a fan-made educational/project app and is not affiliated with Attack on Titan, Hajime Isayama, Kodansha, MAPPA, or Wit Studio.
