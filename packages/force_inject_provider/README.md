# 🧩 force_inject_provider

A plugin that integrates the [ForceInject](https://pub.dev/packages/force_inject) DI container with the popular [Provider](https://pub.dev/packages/provider) package in Flutter.

> 🛠️ Easily create scoped dependency injection and reactive `ChangeNotifier` ViewModels.

## ✨ Features

- ✔️ `ProviderScope` to manage lifecycle-aware DI scopes
- ✔️ `ProviderNotifierBuilder<T>` to inject and listen to `ChangeNotifier`s
- ✔️ Automatically disposes ViewModels
- ✔️ Clean integration with `force_inject`

## 🚀 Getting Started

### 1. Define your services:

```dart
final services = ServiceCollection();
services.addScoped<CounterViewModel, CounterViewModel>();

ServiceProvider.registerConstructor<CounterViewModel>(
  () => CounterViewModel(),
  [],
);

final provider = services.buildServiceProvider();
```

### 2. Wrap your app or page in a `ProviderScope`:

```dart
return ProviderScope(
  create: () => provider.createScope(),
  child: MyApp(),
);
```

### 3. Use `ProviderNotifierBuilder<T>` to inject your ViewModel:

```dart
ProviderNotifierBuilder<CounterViewModel>(
  builder: (context, viewModel, _) => Text('${viewModel.count}'),
)
```

## 📦 Example

See [`example/minimal_provider_di`](https://github.com/diegomgarcia/force_inject/tree/main/example/minimal_provider_di) for a full working Flutter app.

## 📜 License

MIT — Free to use, modify, and distribute.
