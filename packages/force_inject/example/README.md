# 🧪 force_inject Example

This is a minimal Dart console example showing how to use the [`force_inject`](https://pub.dev/packages/force_inject) dependency injection container in pure Dart.

### 📂 Full Example on GitHub

👉 https://github.com/diegomgarcia/force_inject/tree/main/example/minimal_dart_di
👉 https://github.com/diegomgarcia/force_inject/tree/main/example/minimal_flutter_di

### 🚀 To run it:

```bash
cd example/minimal_dart_di
dart run
```

### ✅ What It Demonstrates

- Registering services using `ServiceCollection`
- Constructor injection using `registerConstructor`
- Resolving services using `ServiceProvider.get<T>()`
- Working with singleton, transient and scoped lifetimes

### ✨ Sample Code

```dart
final services = ServiceCollection();

services.addSingleton<ILogger, ConsoleLogger>();
services.addTransient<UserService, UserService>();

ServiceProvider.registerConstructor<ConsoleLogger>(() => ConsoleLogger(), []);
ServiceProvider.registerConstructor<UserService>(
  (ILogger logger) => UserService(logger),
  [ILogger],
);

final provider = services.buildServiceProvider();
final userService = provider.get<UserService>();
userService.sayHello();
```

---

Built with ❤️ by [@diegomgarcia](https://github.com/diegomgarcia)
