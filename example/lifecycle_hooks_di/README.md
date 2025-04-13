# 🔁 ForceInject Lifecycle Hooks Example

This example demonstrates the use of `Initializable` and `Disposable` interfaces within scoped services using [force_inject](https://pub.dev/packages/force_inject).

---

## 💡 Features

- Calls `init()` automatically after resolving a service that implements `Initializable`
- Calls `dispose()` when the `ServiceScope` is disposed
- Great for handling timers, streams, or ViewModels

---

## 🚀 How to Run

```bash
cd example/lifecycle_hooks_di
dart pub get
dart run
```

---

## 📦 How it Works

```dart
class LoggingService implements Initializable, Disposable {
  @override
  void init() {
    print('[LoggingService] Initialized');
  }

  @override
  void dispose() {
    print('[LoggingService] Disposed');
  }

  void doSomething() {
    print('[LoggingService] Doing something important.');
  }
}
```

When this service is resolved from a scope, `init()` is called automatically.  
And when the scope is disposed, `dispose()` is also automatically triggered.

---

Made with 💙 by [@diegomgarcia](https://github.com/diegomgarcia)
