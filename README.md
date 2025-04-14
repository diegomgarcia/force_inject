<p align="center">
  <img src="branding/logo_small_no_name.png" width="300" alt="force inject logo" />
</p>

<h1 align="center">ForceInject</h1>

<p align="center">
  <em>A modular, zero-runtime-dependency Dependency Injection (DI) system for Dart and Flutter — inspired by .NET Core, and built for clean architecture lovers.</em>
</p>

<p align="center"><strong>This is the Way.</strong></p>

## 📦 Packages

| Package                                                   | Description |
|-----------------------------------------------------------|-------------|
| [`force_inject`](./packages/force_inject)                 | Core DI container with singleton, transient, and scoped lifetimes. Zero dependencies, pure Dart. |
| [`force_inject_flutter`](./packages/force_inject_flutter) | Flutter integration helpers like `ForceScopeWidget`, `ForceViewModelBuilder<T>`, and more. |

## 🚀 Examples

Explore real-world usage of ForceInject in Dart and Flutter:

- 🧱 [`minimal_dart_di`](./example/minimal_dart_di)  
  A minimal Dart CLI app using singleton and transient services.

- 📱 [`minimal_flutter_di`](./example/minimal_flutter_di)  
  A Flutter app using scoped DI and a ViewModel with `ValueNotifier`.

- 📱 [`scoped_widget_flutter_di`](./example/scoped_widget_flutter_di)  
  A Flutter app using `ForceScopeWidget` and `ForceViewModelBuilder` DI and a ViewModel.


> To run Flutter examples, remember to generate platform folders first:
>
> ```bash
> cd example/minimal_flutter_di
> flutter create .
> flutter pub get
> flutter run
> ```

---

## 🎯 Goals

- Zero runtime dependencies in core
- No mirrors or code generation
- Explicit constructor-based injection
- Lifecycle-aware DI (singleton, transient, scoped)
- Clean, modular architecture for Dart & Flutter apps
- Flutter integrations that stay optional and unopinionated

## 🙌 Support & Contributions

Created by [@diegomgarcia](https://github.com/diegomgarcia) 🇨🇦  
This project is open to contributions — especially companion packages like:

- `forceinject_riverpod`
- `forceinject_bloc`
- `forceinject_codegen`

## Support me ([@diegomgarcia](https://github.com/diegomgarcia)) with Patreon

[![Patreon](https://c5.patreon.com/external/logo/become_a_patron_button.png)](https://www.patreon.com/dmgarcia)

Or make a donation buying me a coffee:

[![Buy Me A Coffee](https://user-images.githubusercontent.com/835641/60540201-fcd7fa00-9ce4-11e9-87ec-1e98568e9f58.png)](https://www.buymeacoffee.com/dmgarcia)

## 📜 License

MIT License — Free to use, modify, and extend.

**May the DI be with you. ⚔️**
