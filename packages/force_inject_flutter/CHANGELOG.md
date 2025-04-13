# Changelog

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
