# 🧪 minimal_dart_di

This is a minimal pure Dart example demonstrating how to use the [`force_inject`](https://pub.dev/packages/force_inject) dependency injection container.

It mimics the experience of .NET Core-style DI but in Dart — with no dependencies, no code generation, and no mirrors.

## 🚀 Running the Example

```bash
cd example/minimal_dart_di
dart run
```

## ✅ What It Demonstrates

- Registering services with `ServiceCollection`
- Using `ServiceLifetime.singleton` and `transient`
- Constructor-based injection via `ServiceProvider.registerConstructor`
- Resolving dependencies with `ServiceProvider.get<T>()`

## 💡 Example Output

When you run the example, you’ll see:

```
[LOG]: Hello from UserService!
```

## 📦 How It Works

### 1. Register services

```dart
services.addSingleton<ILogger, ConsoleLogger>();
services.addTransient<UserService, UserService>();
```

### 2. Register constructors

```dart
ServiceProvider.registerConstructor<ConsoleLogger>(() => ConsoleLogger(), []);

ServiceProvider.registerConstructor<UserService>(
  (ILogger logger) => UserService(logger),
  [ILogger],
);
```

### 3. Build and resolve

```dart
final provider = services.buildServiceProvider();
final userService = provider.get<UserService>();
userService.sayHello();
```

---

Made with ❤️ using [force_inject](https://pub.dev/packages/force_inject) by [@diegomgarcia](https://github.com/diegomgarcia)
