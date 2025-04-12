# 📱 forceinject_flutter

Flutter integration for [ForceInject](https://pub.dev/packages/force_inject) — a zero-runtime-dependency DI container inspired by .NET Core.

## ✨ Features

- `ForceScopeWidget` — Automatically manages scoped lifetimes tied to widget lifecycle
- `ForceViewModelBuilder<T>` — Injects and rebuilds using reactive `ValueNotifier` ViewModels
- No state management dependency — works with any pattern (MVVM, Clean, Redux, etc.)
- Pure Dart and Flutter — lightweight and testable

## 🧪 Example

Check out the [`scoped_widget_flutter_di`](../../example/scoped_widget_flutter_di) example for a complete working app.

```dart
ForceScopeWidget(
  provider: provider,
  child: ForceViewModelBuilder<MyViewModel>(
    builder: (context, vm) => Text('${vm.count.value}'),
  ),
)
```

## 📦 Requirements

- Flutter 3.10+
- Dart 3.6+
- `force_inject` >= 0.2.0

## 💡 Use Cases

- Scoped ViewModels per screen
- Widget-driven lifetime management
- Modular app architecture

## 🧰 No Code Generation

ForceInject and its Flutter integration work without:

- `build_runner`
- annotations
- mirrors
- codegen

Use pure constructor-based registration — just like .NET Core DI.

## 📜 License

MIT — use it freely in commercial or personal projects.

---
Made with ❤️ by [@diegomgarcia](https://github.com/diegomgarcia)
