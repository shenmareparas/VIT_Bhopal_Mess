# AI Agents Guidelines

This document provides instructions, workflows, and standards for AI coding agents operating within the VIT Bhopal Mess repository.

## Project Summary
VIT Bhopal Mess is a Flutter application designed for VIT Bhopal University students to check real-time mess meal timings, menus, and item prices across on-campus eateries (Mess, UnderBelly, Mayuri, and Canteen).

## Environment and Tooling Standards

- **Dart and Flutter SDKs**:
  - Flutter SDK: `3.50.x` or later (installed at `~/Developer/flutter`)
  - Dart SDK: `3.14.x` or later
  - Use `package:material_ui/material_ui.dart` instead of the legacy deprecated `package:flutter/material.dart`.
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
  - Adhere to Model-View-ViewModel (MVVM) patterns.
  - Models: Data classes and JSON parsing in `lib/models/` and `lib/parsers/`.
  - ViewModels / State: State holders and theme providers in `lib/provider/`.
  - Views: Modular screens in `lib/screens/` and reusable widgets in `lib/widgets/`.
- **Code Completeness**:
  - Write complete, production-ready code. Do not introduce placeholder comments or unhandled `TODO` stubs.
- **Icon Usage**:
  - Use `FaIcon(FontAwesomeIcons.<iconName>)` for Font Awesome icons (due to `font_awesome_flutter` 11+ requirements). Standard `Icon` should only be used with `Icons.<iconName>`.
- **Formatting and Quality Gate**:
  - Always execute `dart format .` after updating Dart code.
  - Always execute `flutter analyze` and confirm 0 errors and 0 warnings before concluding any task.
- **Git Restrictions**:
  - Never execute `git commit`, `git push`, or destructive commands (`git reset --hard`, `git clean -f`) without explicit user instruction.
- **Documentation**:
  - Do not include emojis in any markdown (`.md`) files.
