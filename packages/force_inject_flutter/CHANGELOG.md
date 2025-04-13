# Changelog

## 0.3.0

✨ Features
- Added support for **asynchronous ViewModel lifecycle** via `ForceAsyncInitializableViewModel`
  - Automatically calls `initAsync(BuildContext context)` after widget build
  - Integrates into `ForceViewModelBuilder` with optional `loadingBuilder`, `errorBuilder`, `onInitComplete`, and `onInitError`

🧪 Example Added:
- `async_viewmodel_flutter_di`: demonstrates loading state, error fallback, and async injection with scope and disposal

🔧 Enhancements:
- `ForceViewModelBuilder` now supports sync + async init detection
- Maintains full support for `ValueListenable` and `Disposable`

## 0.2.0

✨ Features
- Added **`ForceInitializableViewModel`** interface:
    - Automatically calls `init(context)` on ViewModels injected via `ForceViewModelBuilder<T>`
    - Useful for reading `BuildContext` (theme, localization, etc.)

- `ForceViewModelBuilder` now triggers `dispose()` if your ViewModel implements `Disposable`

🧪 Added test: `force_view_model_lifecycle_test.dart`
📚 Added example: `viewmodel_lifecycle_flutter_di`

## 0.1.1

- README.md improvements

## 0.1.0

- Initial release 🎉
- Added `ForceScopeWidget` for scoped lifetimes in Flutter
- Added `ForceViewModelBuilder<T>` for reactive ViewModel injection
