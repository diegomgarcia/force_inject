import 'service_descriptor.dart';
import 'service_provider.dart';
import 'service_lifetime.dart';

class ServiceCollection {
  final List<ServiceDescriptor> _descriptors = [];

  void addSingleton<TService, TImplementation extends TService>() {
    _descriptors.add(ServiceDescriptor(
      type: TService,
      implementationType: TImplementation,
      lifetime: ServiceLifetime.singleton,
    ));
  }

  void addTransient<TService, TImplementation extends TService>() {
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

  void addScoped<TService, TImplementation extends TService>() {
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
