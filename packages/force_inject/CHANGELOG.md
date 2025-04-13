# Changelog

## 0.4.0

✨ Features
- Added **Modular DI** support with `ForceInjectModule` interface
- Modules can encapsulate service + constructor registration
- `addModule()` extension simplifies service setup and keeps code modular

## 0.3.0

✨ Features
- Support for **named** and **tagged** service resolution:
    - `get<T>(name: ...)`
    - `getTagged<T>(tag)`
    - `getAll<T>()` to resolve multiple implementations of a type

- Scoped DI now includes **auto-disposal**:
    - If a service implements `Disposable`, it’s disposed when the `ServiceScope` is destroyed

🧰 Internals
- Added `Disposable` interface
- Extended `ServiceProvider` and `ServiceScope` to track tagged/named instances
- Improved internal resolution logic with `_resolveDescriptor` method

## 0.2.3

- README.md improvements

## 0.2.2

- Introduced support to scoped lifetime
- Introduced example for flutter with scoped lifetime.
- README.md improvements

## 0.1.0

- Initial release
- Supports singleton and transient lifetimes
- Manual constructor registration
- Clean C#-style architecture
- Designed for use in backend, CLI, and Flutter
