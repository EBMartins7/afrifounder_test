# Flutter Items Manager App

A simple Flutter application for managing a list of items with CRUD functionality and persistent storage.

## Features

- View, add, edit, and delete items
- Swipe-to-delete with confirmation
- Light/Dark/System theme toggle
- Persistent local storage
- Clean code structure with custom widgets

## Tools & Libraries

| Library | Purpose |
|---------|---------|
| **provider** (^6.1.1) | State management |
| **hive** (^2.2.3) | Local NoSQL database |
| **hive_flutter** (^1.1.0) | Flutter integration for Hive |
| **hive_generator** (^2.0.1) | Code generation for Hive adapters |
| **build_runner** (^2.4.7) | Build system for code generation |

## Approach

**Architecture**: MVVM-inspired pattern with separation of concerns
- **Models**: Data structures (ItemModel)
- **Providers**: State management and business logic
- **Screens**: UI pages (Home, Add/Edit)
- **Widgets**: Reusable components (ItemCard)

**State Management**: Provider was chosen for simplicity and minimal boilerplate while maintaining clean separation between UI and logic.

**Storage**: Hive was selected over shared_preferences for better performance with complex objects and native support for custom types.

## Setup

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Generate Hive adapters:
   ```bash
   flutter pub run build_runner build
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart
├── models/
│   └── item_model.dart
├── providers/
│   ├── item_provider.dart
│   └── theme_provider.dart
├── screens/
│   ├── home_screen.dart
│   └── add_edit_screen.dart
└── widgets/
    └── item_card.dart
```
