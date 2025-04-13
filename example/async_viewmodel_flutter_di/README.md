# 🔐 ForceInject Async ViewModel Lifecycle (Flutter)

This example shows how to use `ForceAsyncInitializableViewModel` to load your ViewModel state asynchronously before building the UI.

## ✨ Features

- ViewModel loads with a delay (e.g. simulating API call)
- UI shows a loading spinner while waiting
- Optional error handling and disposable cleanup

## 📂 Structure

- `AuthViewModel` implements `ForceAsyncInitializableViewModel` and `Disposable`
- Injected using `ForceViewModelBuilder`
- Shows loading spinner until `initAsync(context)` completes
- On failure, shows fallback error UI

## 🧪 Try it

```bash
cd example/async_viewmodel_flutter_di
flutter pub get
flutter run
```

You should see:

```
Welcome Diego Garcia!
```

---

Made with 💙 using [force_inject_flutter](https://pub.dev/packages/force_inject_flutter)
