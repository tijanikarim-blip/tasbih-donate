# سبح وتبرع (Tasbih & Donate)

**كل تسبيحة تصنع أثراً — Every Tasbih Creates Impact**

A premium cross-platform Islamic mobile application built with Flutter that transforms remembrance of Allah (Dhikr) into real charitable impact.

## Features

- 📿 **Tasbih Counter** — Interactive prayer beads with haptic feedback and floating animations
- 🕌 **Authentic Adhkar** — Time-based adhkar (morning, evening, night) from Sahih Hadith
- 🎧 **Audio Playback** — Listen to adhkar with playback controls, sleep timer, and offline support
- ❤️ **Emotional Dhikr Assistant** — Recommends adhkar based on your emotional state
- 🎉 **Special Occasion Duas** — Life-event supplications with shareable cards
- 🛍️ **باب الأجر (Store of Good Deeds)** — Charity marketplace with direct and sustainable impact projects
- 🌟 **My Impact (أثري)** — Personal dashboard with achievements and donation proof
- 📊 **Financial Transparency** — Detailed reports with PDF download
- 🏆 **Gamification** — Streaks, achievements, and shareable impact badges
- 🤲 **Smart Recommendations** — AI-powered spiritual suggestions based on time, mood, and history

## Tech Stack

| Technology | Purpose |
|------------|---------|
| Flutter 3.41 | Cross-platform framework |
| Dart 3.11 | Programming language |
| Firebase Auth | Authentication |
| Cloud Firestore | Database |
| Firebase Storage | File storage |
| Firebase Cloud Messaging | Push notifications |
| Google AdMob | Advertising |
| Riverpod | State management |
| GoRouter | Navigation |
| Hive | Local caching |
| Lottie | Animations |
| just_audio | Audio playback |

## Architecture

Clean Architecture with 4 layers:

```
lib/
├── presentation/     # UI screens and widgets
├── application/      # Use cases and services
├── domain/           # Models and repository interfaces
├── infrastructure/   # Data sources and implementations
└── shared/           # Theme, constants, utilities, router
```

## Screens

1. **Splash Screen** — Mosque silhouette, gold crescent, app branding
2. **Home Screen (Tasbih)** — Prayer beads animation, counter, swipeable dhikr, stats cards
3. **Adhkar Screen** — Time-based tabs (morning/noon/evening/night), featured card, suggestions
4. **Emotional Assistant** — Mood grid with personalized dhikr recommendations
5. **Recommendation Result** — Suggested dhikr, dua, and quranic verses
6. **Audio Player** — Reciter portrait, progress slider, playback controls
7. **Occasion Duas** — Life events grid with dua dialogs
8. **باب الأجر** — Charity marketplace with search, categories, and progress bars
9. **Project Details** — Funding progress, contributors, donation CTA
10. **My Impact (أثري)** — Profile, statistics, achievements gallery
11. **Financial Reports** — Revenue breakdown, PDF download
12. **More** — Settings, favorites, shortcuts, logout

## Setup Instructions

### Prerequisites

- Flutter SDK 3.41+ ([install guide](https://docs.flutter.dev/get-started/install))
- Dart 3.11+
- Firebase project ([console](https://console.firebase.google.com))

### 1. Clone & Install

```bash
cd tasbih
flutter pub get
```

### 2. Firebase Configuration

#### Android

1. Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
2. Add an Android app with package name `com.tasbihdonate.tasbih_donate`
3. Download `google-services.json` and place it in `android/app/`
4. Enable Authentication (Email/Password, Google, Apple)
5. Enable Firestore, Storage, and Cloud Messaging

#### iOS

1. Add an iOS app with bundle ID `com.tasbihdonate.tasbihDonate`
2. Download `GoogleService-Info.plist` and add to Xcode Runner
3. Enable Sign In with Apple capability

### 3. Google AdMob

1. Create an AdMob account
2. Register your app and get Ad Unit IDs
3. Update ad unit IDs in the source code

### 4. Run

```bash
flutter run
```

### 5. Build

```bash
flutter build apk --release    # Android
flutter build ios --release    # iOS
```

## Firebase Collections

```
users
adhkar
tasbih_sessions
charity_items
projects
donations
impact_proofs
financial_reports
audit_logs
achievements
notifications
adhkar_categories
audio_tracks
emotional_states
emotional_recommendations
occasion_duas
favorites
daily_suggestions
listening_sessions
mood_logs
spiritual_recommendations
```

## Design

- **Primary**: Emerald Green (#0F6B4A), Gold (#D4AF37), Ivory (#FFFDF7)
- **Background**: Deep Emerald (#063A2E)
- **Typography**: Cairo (Arabic), system default (English)
- **Style**: Minimalist, elegant, premium Islamic aesthetics

## License

Private project. All rights reserved.
