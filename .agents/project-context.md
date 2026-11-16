# Project Context

This document provides architectural context, directory structures, dependencies, and configuration details for the VIT Bhopal Mess project.

## Overview
- **Application Name**: VIT Bhopal Mess
- **Application ID**: `com.shenmareparas.vit_mess`
- **Web App URL**: `https://vitbmess.vercel.app/`
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
│   └── Runner/
│       └── Info.plist          # Configured with LSApplicationQueriesSchemes for external links
├── lib/
│   ├── main.dart               # Entry point, MultiProvider setup, theme & mess initialization, splash screen, routing, AppScrollBehavior
│   ├── models/
│   │   ├── menu_item.dart      # Unified MenuItem entity model
│   │   └── map.dart            # Schedule catalogs and eatery food lists
│   ├── parsers/
│   │   └── mess_menu_paser.dart # Mess schedule and helper accessor functions
│   ├── provider/
│   │   ├── theme_provider.dart # Dynamic theme state management (System Default, Light, Dark) with M3 chip themes
│   │   ├── mess_provider.dart  # Mess schedule, selected day/meal, messNames mapping, and SharedPreferences persistence
│   │   └── canteen_view_model.dart # Eatery catalog, search, filter, and cart state management
│   ├── screens/
│   │   ├── about.dart          # About page, app info, confetti celebration with 1.5K+ downloads counter
│   │   ├── canteen.dart        # Canteen menu, search, multi-column grid, and desktop cart integration
│   │   ├── cart.dart           # Canteen cart route (wrapper for GenericCartScreen)
│   │   ├── cartM.dart          # Mayuri cart route (wrapper for GenericCartScreen)
│   │   ├── cartUB.dart         # UnderBelly cart route with WhatsApp order composer
│   │   ├── generic_cart_screen.dart # Unified cart UI with responsive 2-column checkout on desktop
│   │   ├── developer.dart      # Contributor profiles and social links with responsive 1-2 column layout
│   │   ├── home_screen.dart    # Main screen holding the four primary tabs with adaptive desktop header
│   │   ├── mayuri.dart         # Mayuri eatery menu, search, category chips, and desktop cart integration
│   │   ├── mess.dart           # Mess menu display with time detection, inline day/meal chips on desktop, and reset FAB
│   │   ├── settings.dart       # App settings, mess selection, iOS inset grouped design, and tri-state theme picker
│   │   ├── underbelly.dart     # UnderBelly eatery menu, search, category chips, and desktop cart integration
│   │   └── welcome.dart        # Onboarding introduction screen with responsive max-width centering
│   ├── utils/
│   │   ├── color_schemes.dart  # Material UI 3 Expressive color palettes with brand deep greens
│   │   └── floating_snackbar.dart # Custom snackbar utilities
│   └── widgets/
│       ├── desktop_cart_panel.dart # Live order summary sidebar for desktop browser viewports
│       ├── dev_card.dart       # Developer information card widget with platform-resilient URL launcher
│       ├── menu_item_card.dart # Responsive food item card with hover elevations and counter controls
│       └── responsive_layout.dart # Breakpoint helpers, ResponsiveContentWrapper, and layout builders
├── web/                        # Web host assets and metadata configuration
│   ├── favicon.png             # Web browser favicon
│   ├── icon_circle.png         # Circular icon for web metadata and OpenGraph sharing
│   ├── icons/                  # Web application launcher icons
│   ├── index.html              # HTML entry point with OpenGraph, Twitter Cards, and theme-color meta tags
│   └── manifest.json           # Web app manifest for PWA installation
├── pubspec.yaml                # Package dependencies and asset declarations
└── analysis_options.yaml       # Dart analyzer rules and exclusions
```

## Key Technologies and Packages

- **Framework**: Flutter 3.50+ / Dart 3.14+
- **Design System**: `package:material_ui/material_ui.dart` (Material 3 Expressive) and `package:cupertino_ui/cupertino_ui.dart`
- **Architecture**: Model-View-ViewModel (MVVM) powered by `provider`
- **State Management**: `provider` (Theme, Mess, and Canteen ViewModels)
- **Persistent Storage**: `shared_preferences` (Persisting user preferences, selected mess, and theme mode)
- **Theme Modes**: Tri-state theme support: System Default (default), Light Theme, and Dark Theme
- **Animations and UI**: `animate_do`, `flutter_animate`, `confetti`, `introduction_screen`
- **Iconography**: `cupertino_icons`, `font_awesome_flutter`
- **Utilities**: `intl`, `url_launcher`, `share_plus`, `upgrader`

## Architectural Design (MVVM)

The project strictly follows the Model-View-ViewModel (MVVM) architectural pattern:

- **Model Layer (`lib/models/`)**:
  - `MenuItem`: Encapsulates food item properties (`id`, `name`, `price`, `quantity`, `category`). Free of any UI dependencies.
  - `map.dart`: Contains static food catalogs, pricing lists, caterer information, and store contact phone numbers.
  - `parsers/mess_menu_paser.dart`: Parses mess schedules and resolves the meal slot based on the current timestamp.

- **ViewModel / Provider Layer (`lib/provider/`)**:
  - `MessProvider`: Manages the selected mess index (1: CRCL Mess, 2: Mayuri Mess, 3: AB Girls Mess, 4: Safal Mess), day selection, meal slot, and current meal items. Persists mess choice in `SharedPreferences`. Exposes `messNames` mapping and `currentMessName`.
  - `ThemeProvider`: Manages theme configuration (`ThemeType.system`, `ThemeType.light`, `ThemeType.dark`), persists preference, and builds M3 Expressive theme data with custom chip themes.
  - `CanteenViewModel`: Manages eatery catalog state, category filters, item search, quantity increments/decrements, total price calculation, and cart reset.

- **View Layer (`lib/screens/` and `lib/widgets/`)**:
  - Screens consume providers via `Consumer` or `Provider.of` and never hold internal business logic.
  - Reusable widgets decompose layouts into modular components (`DesktopCartPanel`, `MenuItemCard`, `ResponsiveLayout`, `ResponsiveContentWrapper`, `DevCard`).

## Responsive Web & Desktop Architecture

- **Breakpoints**: Defined in `lib/widgets/responsive_layout.dart`:
  - `mobile`: Width < 640px
  - `tablet`: 640px <= Width < 1024px (with `Breakpoints.isWide` at >= 840px)
  - `desktop`: Width >= 1024px
  - `maxContentWidth`: 1200px
- **Layout Max-Width Boundaries**: Desktop screens wrap primary views in `ResponsiveContentWrapper` to prevent unnatural horizontal stretching on 1080p, 1440p, and 4K monitors (e.g., 640px for About/Settings, 1040px for Mess, and 1240px for eateries).
- **Adaptive Header Navigation**:
  - Wide screens display a centered header navigation bar with labeled icons.
  - Includes an inline 1-click caterer mess switcher dropdown button (`MessProvider.messNames`) directly in the app bar.
  - Includes a quick-access theme toggle icon button in the header.
- **Desktop Live Side-Cart (`DesktopCartPanel`)**:
  - Rendered alongside menu catalogs on desktop viewports (>= 1024px).
  - Displays real-time selected items, quantity increments/decrements, removal, price calculation, and direct WhatsApp or phone order dispatch.
- **Direct Selectors on Desktop Mess View**:
  - Replaces modal selection dialogs with inline horizontal filter chips for days (Monday through Sunday) and meals (Breakfast, Lunch, Snacks, Dinner).
  - Automatically highlights the current day and active meal slot.
- **Multi-Column Catalog Grids**:
  - Dynamically switches from a single-column list on mobile to 2, 3, or 4 columns on tablet and desktop monitors.
- **Desktop Ergonomics**:
  - `MenuItemCard` provides elevation and border animations on mouse hover.
  - Interactive elements specify pointer cursors (`SystemMouseCursors.click`).
  - `AppScrollBehavior` in `lib/main.dart` enables drag scrolling for mouse, trackpad, touch, and stylus devices.
- **Navigation Gesture Safety**:
  - Swipe gestures on `TabBarView` are disabled on Web and desktop platforms (`kIsWeb || isDesktopPlatform || Breakpoints.isDesktop(context)`) to prevent conflicting horizontal page transitions.
- **Web Platform Safety**:
  - Runtime `Platform` checks from `dart:io` are guarded by `!kIsWeb` to prevent crashes on Flutter Web. Mobile-specific APIs (`SystemChrome.setPreferredOrientations`, `UpgradeAlert`) run only on native platforms.

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
- **URL Scheme Querying**: Configured `LSApplicationQueriesSchemes` for `https`, `http`, `tel`, `mailto`, and `whatsapp` in `Info.plist`.
- **Platform Experience**: iOS inset grouped cards, `CupertinoSwitch`, and tactile haptic feedback.
- **Xcode / iOS Support**: Tested and verified up to iOS 27.2 simulators.
- **WebAssembly (Wasm)**: Fully supported and verified via `flutter build web --wasm` with WasmGC.
- **Web Metadata & Sharing**: Configured OpenGraph (`og:type`, `og:url`, `og:title`, `og:description`, `og:image`), Twitter Cards (`twitter:card`, `twitter:url`, `twitter:title`, `twitter:description`, `twitter:image`), and `theme-color` meta tags in `web/index.html`.
