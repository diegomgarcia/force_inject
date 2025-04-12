# 🔌 ForceInject

🛠️ A lightweight, zero-dependency Dependency Injection (DI) container for Dart.  
🌌 Inspired by .NET Core and powered by the Force.  
**This is the Way.**

---

## ✨ Features

- Constructor-based dependency injection
- Support for `singleton` and `transient` lifetimes
- Zero dependencies — pure Dart
- No code generation, no mirrors
- Inspired by C#/.NET Core DI patterns
- Lightweight, test-friendly, and easy to integrate

---

## 🚀 Getting Started

### 1. Register your services

```dart
final services = ServiceCollection();

services.addSingleton<ILogger, ConsoleLogger>();
services.addTransient<UserService, UserService>();

ServiceProvider.registerConstructor<ConsoleLogger>(() => ConsoleLogger(), []);
ServiceProvider.registerConstructor<UserService>(
  (ILogger logger) => UserService(logger),
  [ILogger],
);
```

### 2. Build the provider

```dart
final provider = services.buildServiceProvider();
```

### 3. Resolve services

```dart
final userService = provider.get<UserService>();
userService.sayHello(); // [LOG]: Hello from UserService!
```

---

## ⚙️ Lifetimes

| Type        | Description                                |
|-------------|--------------------------------------------|
| `singleton` | One shared instance across the application |
| `transient` | A new instance is created every time       |

---

## 📦 Why ForceInject?

Dart is an elegant language, but backend structure is still evolving.  
**ForceInject** gives you the power of .NET’s DI model, but in pure Dart — making your code modular, testable, and maintainable.

No magic. No mirrors. Just clean, focused architecture.  
💬 *"When your services are confused, inject them you must."* – Yodart

---

## 🧪 Examples & Playground

Check out the `example/` folder for more real-world setups.

---

## 📜 License

MIT – Free to use, modify, or extend.  
**May the DI be with you. ⚔️**
