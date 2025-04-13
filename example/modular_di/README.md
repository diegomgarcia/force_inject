# 🧩 ForceInject Modular DI Example

This example demonstrates how to organize services using `ForceInjectModule`.

Instead of registering services and constructors manually, you can group them in a module:

```dart
final services = ServiceCollection()
  ..addModule(AuthModule());
```

The `AuthModule` in this example registers:
- `AuthService` (singleton)
- `UserService` (transient), which depends on `AuthService`

## 📂 Structure

```
lib/
├── modules/
│   └── auth_module.dart
└── services/
    ├── auth_service.dart
    └── user_service.dart
```

## 🧪 Includes

- A CLI `main.dart` that resolves and uses the services
- A test to verify the `UserService` is resolved correctly with its dependency

---

## ▶️ Run

```bash
# Run the CLI example
dart lib/main.dart

# Run the test
dart test
```

You should see:

```
User loaded with token: auth-token-123
```

---

Made with 💙 using [force_inject](https://pub.dev/packages/force_inject)
