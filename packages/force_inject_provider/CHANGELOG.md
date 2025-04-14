# Changelog

## 0.1.0

🎉 Initial release of `force_inject_provider`!

- Integrates `force_inject` with Flutter's `provider` package
- Provides:
    - `ProviderScope` – scoped DI management using `ServiceScope`
    - `ProviderNotifierBuilder<T>` – binds `ChangeNotifier` ViewModels from the scope
- Automatically disposes ViewModels when scope is destroyed
- Includes working example: [`example/minimal_provider_di`](../../example/minimal_provider_di)

