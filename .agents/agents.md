# AI Agents Guidelines

This document provides instructions, workflows, and standards for AI coding agents operating within the VIT Bhopal Mess repository.

## Project Summary
VIT Bhopal Mess is a Flutter application designed for VIT Bhopal University students to check real-time mess meal timings, menus, and item prices across on-campus eateries (Mess, UnderBelly, Mayuri, and Canteen).

## Environment and Tooling Standards

- **Dart and Flutter SDKs**:
  - Flutter SDK: `3.50.x` or later (installed at `~/Developer/flutter`)
  - Dart SDK: `3.14.x` or later
  - Use `package:material_ui/material_ui.dart` instead of the legacy deprecated `package:flutter/material.dart`.
  - Use `package:cupertino_ui/cupertino_ui.dart` for Cupertino components instead of deprecated `package:flutter/cupertino.dart`.
  - Swift Package Manager (SPM): Enabled (`flutter config --enable-swift-package-manager`). CocoaPods has been deintegrated.
  - WebAssembly (Wasm): Fully supported and verified (`flutter build web --wasm`).
- **Package Management and Tooling**:
  - Flutter/Dart: Use `flutter pub get`, `flutter pub upgrade`, `dart format .`, and `flutter analyze`.
  - JavaScript / TypeScript: Always use Bun (`bun`, `bunx`). Do not use Node.js, npm, or npx.
  - Python: Always use uv (`uv`, `uvx`). Do not use pip or standard venv.
- **Android Toolchain**:
  - Gradle: `9.5.0`
  - Android Gradle Plugin (AGP): `9.3.1`
  - Kotlin: `2.4.20`
  - JVM Target and Source/Target Compatibility: Java 17

## Code Standards

- **Architecture**:
  - Strictly adhere to Model-View-ViewModel (MVVM) patterns.
  - Models: Data classes and models in `lib/models/` (e.g., `MenuItem`, `map.dart`). No UI imports allowed in model files.
  - ViewModels / State: State holders, business logic, and providers in `lib/provider/` (e.g., `MessProvider`, `CanteenViewModel`, `ThemeProvider`).
  - Views: Modular screens in `lib/screens/` and reusable widgets in `lib/widgets/`. Views must consume ViewModels/Providers and avoid direct business logic or arbitrary State class instantiations.
- **Design System & Theme**:
  - Material 3 Expressive: All UI components (cards, dialogs, buttons, search bars, navigation tabs) follow M3 Expressive design specifications with tonal elevations and container palettes.
  - Theme Selection: Three options (System Default, Light Theme, Dark Theme) with System Default as default.
  - iOS Adaptations: Platform-aware segmented inset grouped section styling, `CupertinoSwitch`, tactile haptic feedback (`HapticFeedback.selectionClick()`, `HapticFeedback.lightImpact()`), and iOS query scheme compatibility in `Info.plist`.
- **Responsive Web and Desktop Standards**:
  - Breakpoints: Standard Material 3 tiers defined in `lib/widgets/responsive_layout.dart`:
    - Mobile: Width < 640px
    - Tablet: 640px <= Width < 1024px (with `Breakpoints.isWide` threshold at >= 840px)
    - Desktop: Width >= 1024px
    - Max Content Width: 1200px (with screen-specific bounds such as 640px for About/Settings, 1040px for Mess, and 1240px for eatery catalogs)
  - Max-Width Constraints: Always wrap desktop views with `ResponsiveContentWrapper` or appropriate `ConstrainedBox` to prevent unnatural stretching on wide and ultra-wide monitors.
  - Adaptive Navigation: Responsive header bar with centered tabs, quick caterer switcher dropdown (`MessProvider.messNames`), and theme toggle on wide viewports; compact TabBar on mobile.
  - Desktop Live Side-Cart: On desktop screens (>= 1024px), display `DesktopCartPanel` side-by-side with eatery menus for live order summary, price calculation, and direct WhatsApp or phone ordering without screen transitions.
  - Reusable Food Cards: Use `MenuItemCard` for food items with hover elevation transitions, pointer cursor affordances, and quantity counters.
  - Inline Selectors on Desktop: Replace modal day/meal picker dialogs with inline horizontal filter chips on desktop mess views while keeping dialog pickers on mobile.
  - Desktop Ergonomics: Ensure interactive elements provide hover states and pointer cursors (`SystemMouseCursors.click`). Enable mouse, trackpad, touch, and stylus drag scrolling with `AppScrollBehavior`.
  - Navigation Swipe Physics: Disable TabBar swipe physics on web and desktop platforms (`kIsWeb || isDesktopPlatform || Breakpoints.isDesktop(context)`) to prevent accidental page transitions during mouse or trackpad interactions.
  - Platform Safety: Strictly guard all `dart:io` `Platform` calls with `!kIsWeb` to prevent runtime crashes on Flutter Web. Guard mobile-specific APIs (such as `SystemChrome.setPreferredOrientations` and `UpgradeAlert`) from running on Web.
- **Code Completeness**:
  - Write complete, production-ready code. Do not introduce placeholder comments or unhandled `TODO` stubs.
- **Icon Usage**:
  - Use `FaIcon(FontAwesomeIcons.<iconName>)` for Font Awesome icons (due to `font_awesome_flutter` 11+ requirements). Standard `Icon` should only be used with `Icons.<iconName>` or `CupertinoIcons.<iconName>`.
- **Formatting and Quality Gate**:
  - Always execute `dart format .` after updating Dart code.
  - Always execute `flutter analyze` and confirm 0 errors and 0 warnings before concluding any task.
- **Git Restrictions**:
  - Never execute `git commit`, `git push`, or destructive commands (`git reset --hard`, `git clean -f`) without explicit user instruction.
- **Documentation**:
  - Do not include emojis in any markdown (`.md`) files.
