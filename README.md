# 🎬 Movify

![Flutter Version](https://img.shields.io/badge/Flutter-3.10+-blue.svg)
![Dart Version](https://img.shields.io/badge/Dart-3.0+-blue.svg)
![State Management](https://img.shields.io/badge/State_Management-BLoC-blue.svg)
![Available on Play Store](https://img.shields.io/badge/Available_on-Google_Play-green.svg)

**Movify** is a comprehensive, feature-rich movie and TV show discovery application built with **Flutter**. It allows users to explore trending movies, search for specific titles, view detailed information including trailers, and manage their favorite shows. 

The application is built with scalability, clean architecture, and modern UI/UX principles in mind. It is currently published and available on the Google Play Store.

---

## ✨ Features

*   **Authentication**: Secure login and registration using Firebase Auth, including Google Sign-In.
*   **Discover**: Browse trending, popular, and top-rated movies and TV shows. Filter by genres.
*   **Search**: Real-time search functionality to quickly find your favorite content.
*   **Detailed Views**: Comprehensive details for media, including cast, crew, synopses, and embedded YouTube trailers.
*   **Favorites**: Save movies and shows to your personal favorites list for quick access.
*   **User Profile**: Manage account settings and preferences.
*   **Dynamic Theming**: Support for multiple theme modes (Light, Dark, System) and dynamic color palettes.
*   **Onboarding**: Beautiful, infinite-scrolling onboarding flow for new users.
*   **Push Notifications**: Stay updated with Firebase Cloud Messaging.
*   **Over-The-Air (OTA) Updates**: Integrated with **Shorebird** for seamless code pushes without app store approvals.
*   **Monetization**: Integrated with Google Mobile Ads.

---

## 📸 Screenshots

*(Replace these placeholders with actual screenshots of your app)*

| Home Screen | Discover | Details | Profile |
| :---: | :---: | :---: | :---: |
| <img src="https://via.placeholder.com/250x500.png?text=Home" width="200"/> | <img src="https://via.placeholder.com/250x500.png?text=Discover" width="200"/> | <img src="https://via.placeholder.com/250x500.png?text=Details" width="200"/> | <img src="https://via.placeholder.com/250x500.png?text=Profile" width="200"/> |

---

## 🛠️ Tech Stack & Architecture

This project strictly adheres to clean architecture principles and utilizes some of the best packages in the Flutter ecosystem:

*   **Framework**: [Flutter](https://flutter.dev/)
*   **State Management**: BLoC (`flutter_bloc`, `hydrated_bloc` for state persistence)
*   **Dependency Injection**: `get_it`
*   **Routing**: `go_router`
*   **Networking**: `dio` (enhanced with caching and smart retries)
*   **Local Storage**: `hive` & `shared_preferences`
*   **Functional Programming**: `dartz`
*   **Backend Services (Firebase)**: 
    *   Authentication
    *   Cloud Firestore
    *   Crashlytics & Analytics
    *   Remote Config & Performance Monitoring
*   **UI Components**: Lottie animations, Google Fonts, Cached Network Image, Font Awesome.

---

## 📁 Project Structure

The project follows a scalable, feature-based folder structure designed for maintainability:

```text
lib/
│
├── core/                   # Core configurations, networking, theming, errors
├── features/               # Feature modules
│   ├── auth/               # Authentication flow
│   ├── details/            # Movie/Show details screen
│   ├── discover/           # Discovery and genre exploration
│   ├── favorite/           # User favorites
│   ├── home/               # Main landing screens
│   ├── onboarding/         # First-time user experience
│   ├── profile/            # User profile management
│   ├── search/             # Search functionality
│   └── settings/           # App settings and preferences
│
├── shared/                 # Shared widgets and utilities
├── l10n/                   # Localization files
└── main.dart               # Entry point (with dev/prod flavors)
```

---

