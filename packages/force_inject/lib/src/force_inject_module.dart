import 'service_collection.dart';

/// Defines a reusable module for dependency registration.
abstract class ForceInjectModule {
  /// Registers services with their lifetimes (singleton, transient, scoped)
  void registerServices(ServiceCollection services);

  /// Registers constructors with the global service provider registry
  void registerConstructors();
}
