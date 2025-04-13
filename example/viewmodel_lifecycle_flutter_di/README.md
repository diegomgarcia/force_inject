# 📦 ForceInject ViewModel Lifecycle (Flutter)

This example demonstrates how to use `ForceInitializableViewModel` and `Disposable` in Flutter widgets with `ForceInject`.

## 💡 Features

- ViewModels are injected via `ForceViewModelBuilder`
- Automatically call `init(context)` after the first frame
- Automatically dispose scoped services when the widget scope is destroyed

## 📂 Structure

- `HomeViewModel` implements both `ForceInitializableViewModel` and `Disposable`
- Injected in `HomeScreen` using `ForceViewModelBuilder`
- `ForceScopeWidget` ensures each screen has its own scoped lifetime

## 🚀 Run the example

```bash
cd example/viewmodel_lifecycle_flutter_di
flutter pub get
flutter run
```

You should see:

```
[HomeViewModel] Initialized with locale: en
...
[HomeViewModel] Disposed.
```

---

Made with ❤️ using [force_inject](https://pub.dev/packages/force_inject) and [force_inject_flutter](https://pub.dev/packages/force_inject_flutter)
