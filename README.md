# The Brown ☕🍵

A beautiful and modern Flutter application for a premium Cafe/Coffee Shop, featuring a curated selection of Matcha, Coffee, and Tea.

## 🌟 Features

- **Product Catalog**: Browse through visually appealing categories including Matcha, Coffee, and Tea.
- **Dynamic Product Details**: Interactive product pages where users can select sizes and adjust quantities, featuring real-time dynamic price calculation.
- **Shopping Cart**: A fully functional cart system. Users can add items, update quantities, remove individual items, or clear the cart.
- **Favorites System**: Save your favorite drinks to a dedicated favorites screen for quick and easy access later.
- **User Management**: Includes Sign Up and Profile screens for personalized experiences.
- **State Management**: Robust and centralized state management utilizing the `provider` package to efficiently update the Cart and Favorites across the app.
- **Custom UI/UX**: Built with a dedicated theme system, smooth interactions (using `flutter_bounceable`), and a polished design.

## 📂 Project Structure

```text
lib/
├── components/       # Reusable UI components (e.g., product cards, cart items)
├── model/            # Data models and Provider state management (e.g., product_model.dart, product_provider.dart)
├── screen/           # Application screens (Home, Cart, Favorite, Category, Profile, Sign Up, etc.)
├── theme/            # Theme configuration (colors, light/dark mode configurations)
├── widgets/          # Global layout widgets and widget tree
└── main.dart         # Entry point of the application
```

## 🛠️ Tech Stack & Dependencies

- **Framework:** [Flutter](https://flutter.dev/) (SDK ^3.10.0)
- **Language:** [Dart](https://dart.dev/)
- **State Management:** [`provider`](https://pub.dev/packages/provider)
- **UI Enhancements:**
  - [`flutter_bounceable`](https://pub.dev/packages/flutter_bounceable) (For smooth tap animations)
  - [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) (For iOS style icons)

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed on your machine:
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- An IDE such as VS Code, Android Studio, or IntelliJ IDEA.

### Installation & Running

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd the_brown
   ```

2. **Install dependencies:**
   Fetch the necessary packages defined in `pubspec.yaml`:
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   Connect a physical device or start an emulator/simulator, then run:
   ```bash
   flutter run
   ```

## 📸 Screenshots
*(Consider adding screenshots of the Home, Details, Cart, and Favorite screens here below to showcase the UI)*

---
*Created with ❤️ using Flutter.*
