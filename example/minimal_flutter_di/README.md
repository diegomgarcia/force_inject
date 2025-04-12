# 🔥 ForceInject Flutter Example

This is a simple Flutter example demonstrating how to use [`force_inject`](https://pub.dev/packages/force_inject) with scoped dependency injection and a clean ViewModel structure.

> This example intentionally excludes Flutter platform folders to keep the repository clean.  
> To run it locally, you'll need to generate the platform files manually.

---

## 📦 Setup

1. Open this `example/minimal_flutter_di/` folder in your terminal
2. Run the following command to generate required Flutter platform files:

```
flutter create .
```

3. Install dependencies:

```
flutter pub get
```

4. Run the app:

```
flutter run -d chrome         # for web
flutter run -d macos          # for macOS
flutter run -d ios            # if connected and provisioned
flutter run -d <your-device>  # for any connected device
```

---

## 📁 Folder Structure

```
lib/
├── di/
│   └── service_config.dart         # ForceInject setup and registrations
├── viewmodels/
│   └── counter_viewmodel.dart      # A reactive ValueNotifier ViewModel
├── screens/
│   └── home_screen.dart            # Screen using the scoped ViewModel
└── main.dart                       # Entry point, DI bootstrapping
```

---

## 💡 What It Shows

- How to register a scoped service with ForceInject
- How to create and dispose a `ServiceScope` tied to a Flutter screen
- How to bind a ViewModel to a `ValueListenableBuilder` for state updates
- Separation of DI config, ViewModel, and UI for testability and clarity

---

## 🧪 Ready to Build On

You can use this structure to integrate ForceInject into larger apps with:
- Modular architecture
- Feature-based DI
- Widget-specific lifetimes

---

## 👀 Next Steps

You can follow the development of [`forceinject_flutter`](https://pub.dev/publishers/diegogarcia.ca) to get plug-and-play widgets like:

- `ForceScopeWidget`
- `ForceViewModelBuilder<T>`

---

**This is the Way.**
