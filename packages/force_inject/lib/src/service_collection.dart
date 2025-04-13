import 'service_descriptor.dart';
import 'service_provider.dart';
import 'service_lifetime.dart';
import 'force_inject_module.dart';


class ServiceCollection {
  final List<ServiceDescriptor> _descriptors = [];

  void addSingleton<TService, TImplementation extends TService>({
    Object? name,
    Object? tag,
  }) {
    _descriptors.add(ServiceDescriptor(
      type: TService,
      implementationType: TImplementation,
      lifetime: ServiceLifetime.singleton,
      name: name,
      tag: tag,
    ));
  }

  void addTransient<TService, TImplementation extends TService>({
    Object? name,
    Object? tag,
  }) {
    _descriptors.add(ServiceDescriptor(
      type: TService,
      implementationType: TImplementation,
      lifetime: ServiceLifetime.transient,
    ));
  }

  void addInstance<TService>(TService instance) {
    _descriptors.add(ServiceDescriptor(
      type: TService,
      implementationType: TService,
      lifetime: ServiceLifetime.singleton,
      instance: instance,
    ));
  }

  void addScoped<TService, TImplementation extends TService>({
    Object? name,
    Object? tag,
  }) {
    _descriptors.add(ServiceDescriptor(
      type: TService,
      implementationType: TImplementation,
      lifetime: ServiceLifetime.scoped,
    ));
  }

  ServiceProvider buildServiceProvider() {
    return ServiceProvider(_descriptors);
  }
}

extension ModuleSupport on ServiceCollection {
  void addModule(ForceInjectModule module) {
    module.registerServices(this);
    module.registerConstructors();
  }
}

