# Project Context

This document provides architectural context, directory structures, dependencies, and configuration details for the VIT Bhopal Mess project.

## Overview
- **Application Name**: VIT Bhopal Mess
- **Application ID**: `com.shenmareparas.vit_mess`
- **Target Audience**: Students of VIT Bhopal University
- **Core Purpose**: Real-time meal discovery based on current day and time, along with menus, search, cart calculation, and ordering helpers for on-campus eateries (Hostel Mess, UnderBelly, Mayuri, and Canteen).

## Repository Structure

```
VIT_Bhopal_Mess/
├── .agents/
│   ├── agents.md               # Instructions and standards for AI coding agents
│   └── project-context.md      # Comprehensive architecture and technical context
├── android/                    # Android host project (Gradle 9.5.0, AGP 9.3.1, Kotlin 2.4.20)
│   ├── app/
│   │   ├── build.gradle        # App module build config (Java 17, namespace, appId)
│   │   └── src/                # Manifests and launcher icons
│   ├── gradle/wrapper/         # Gradle wrapper configuration
│   └── settings.gradle         # Plugin management and plugin versions
├── assets/                     # Images, developer avatars, playstore assets
├── ios/                        # iOS host project (Swift Package Manager, iOS 15.0+ deployment target)
├── lib/
│   ├── main.dart               # Entry point, MultiProvider setup, theme & mess initialization, routing
│   ├── models/
│   │   ├── menu_item.dart      # Unified MenuItem entity model
│   │   └── map.dart            # Schedule catalogs and eatery food lists
│   ├── parsers/
│   │   └── mess_menu_paser.dart # Mess schedule and helper accessor functions
│   ├── provider/
│   │   ├── theme_provider.dart # Dynamic theme state management (Light/Dark)
│   │   ├── mess_provider.dart  # Mess schedule, selected day/meal, and SharedPreferences persistence
│   │   └── canteen_view_model.dart # Eatery catalog, search, filter, and cart state management
│   ├── screens/
│   │   ├── about.dart          # About page, app info, confetti celebration
│   │   ├── canteen.dart        # Canteen menu, search, filtering, and cart trigger
│   │   ├── cart.dart           # Canteen cart route (wrapper for GenericCartScreen)
│   │   ├── cartM.dart          # Mayuri cart route (wrapper for GenericCartScreen)
│   │   ├── cartUB.dart         # UnderBelly cart route with WhatsApp order composer
│   │   ├── generic_cart_screen.dart # Unified cart UI with animations and dynamic call/order actions
│   │   ├── developer.dart      # Contributor profiles and social links
│   │   ├── home_screen.dart    # Main screen holding the four primary tabs
│   │   ├── mayuri.dart         # Mayuri eatery menu and search
│   │   ├── mess.dart           # Mess menu display with time detection and reactive day/meal picker
│   │   ├── settings.dart       # App settings, mess selection, and theme switching
│   │   ├── underbelly.dart     # UnderBelly eatery menu and search
│   │   └── welcome.dart        # Onboarding introduction screen
│   ├── utils/
│   │   ├── color_schemes.dart  # Material UI 3 color palette definitions
│   │   └── floating_snackbar.dart # Custom snackbar utilities
│   └── widgets/
│       └── dev_card.dart       # Developer information card widget
├── pubspec.yaml                # Package dependencies and asset declarations
└── analysis_options.yaml       # Dart analyzer rules and exclusions
```

## Key Technologies and Packages

- **Framework**: Flutter 3.50+ / Dart 3.14+
- **Design System**: `package:material_ui/material_ui.dart` (Modular Material UI 3)
- **Architecture**: Model-View-ViewModel (MVVM) powered by `provider`
- **State Management**: `provider` (Theme, Mess, and Canteen ViewModels)
- **Persistent Storage**: `shared_preferences` (Persisting user preferences, selected mess, and themes)
- **Animations and UI**: `animate_do`, `flutter_animate`, `confetti`, `introduction_screen`
- **Iconography**: `cupertino_icons`, `font_awesome_flutter`
- **Utilities**: `intl`, `url_launcher`, `share_plus`, `upgrader`

## Android Configuration Details

- **Compile SDK**: `flutter.compileSdkVersion` (Resolves to Android SDK 36)
- **Target SDK**: `flutter.targetSdkVersion` (Resolves to Android SDK 36)
- **Minimum SDK**: `flutter.minSdkVersion` (Resolves to Android SDK 24)
- **Gradle Version**: `9.5.0`
- **Android Gradle Plugin (AGP)**: `9.3.1`
- **Kotlin Version**: `2.4.20`
- **Java Compatibility**: `JavaVersion.VERSION_17` (Source and Target)
- **JVM Target**: `17`
- **Gradle JVM Args**: `-Xmx4096M -XX:MaxMetaspaceSize=1024m`

## iOS and Web Configuration Details

- **iOS Dependency Manager**: Swift Package Manager (SPM). CocoaPods is deintegrated.
- **Minimum iOS Deployment Target**: 15.0
- **Xcode / iOS Support**: Tested and verified up to iOS 27.2 simulators.
- **WebAssembly (Wasm)**: Fully supported and verified via `flutter build web --wasm` with WasmGC.
