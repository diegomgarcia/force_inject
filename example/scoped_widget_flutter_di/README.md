# 🔁 scoped_widget_flutter_di

This is a Flutter example showing how to use **`forceinject_flutter`** to create scoped DI lifecycles using:

- `ForceScopeWidget` to automatically create and dispose `ServiceScope`
- `ForceViewModelBuilder<T>` to inject and bind ViewModels from that scope
- `ValueNotifier` to demonstrate reactive state updates

## 📦 Stack

- **Flutter 3.10+**
- **Dart 3.6+**
- [`force_inject`](../../packages/force_inject)
- [`forceinject_flutter`](../../packages/force_inject_flutter)

## 🧪 What It Demonstrates

- Registering a scoped `ViewModel` (`CounterViewModel`)
- Wrapping the app in a `ForceScopeWidget`
- Using `ForceViewModelBuilder<CounterViewModel>` to inject and bind the ViewModel

## 🚀 Running the App

```bash
flutter pub get
flutter run
```

If you are in a Dart workspace, make sure to run this from the root first:

```bash
dart pub get
```

## 💡 Code Snippet

```dart
ForceScopeWidget(
  provider: provider,
  child: ForceViewModelBuilder<CounterViewModel>(
    builder: (context, viewModel) {
      return Text('Count: ${viewModel.count.value}');
    },
  ),
)
```

## 🧼 Folder Structure

```
lib/
├── di/
│   └── service_config.dart       # DI registration
├── viewmodels/
│   └── counter_viewmodel.dart    # ViewModel with ValueNotifier
├── screens/
│   └── counter_screen.dart       # UI
└── main.dart                     # Sets up scope and root widget
```

---

Built by [@diegomgarcia](https://github.com/diegomgarcia) with ❤️  
Check out the main package: [force_inject on pub.dev](https://pub.dev/packages/force_inject)
