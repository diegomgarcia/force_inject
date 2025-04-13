import 'disposable.dart';
import 'service_descriptor.dart';
import 'service_provider.dart';
import 'service_lifetime.dart';

class ServiceScope extends ServiceProvider {
  final Map<Type, Object> _scopedInstances = {};

  ServiceScope(ServiceProvider parent) : super.internal(parent.descriptors);

  @override
  T get<T>({Object? name}) {
    // Named service lookup
    if (name != null) {
      final descriptor = descriptors.values.firstWhere(
            (d) => d.type == T && d.name == name,
        orElse: () => throw Exception("No named service '$name' for type $T."),
      );
      return _resolveScopedDescriptor<T>(descriptor);
    }

    final descriptor = descriptors[T];
    if (descriptor == null) {
      throw Exception("Service of type $T is not registered");
    }

    if (descriptor.lifetime == ServiceLifetime.singleton) {
      return super.get<T>();
    }

    if (descriptor.lifetime == ServiceLifetime.scoped) {
      if (_scopedInstances.containsKey(T)) {
        return _scopedInstances[T] as T;
      }

      final instance = createInstance(descriptor);
      _scopedInstances[T] = instance;
      return instance as T;
    }

    return createInstance(descriptor) as T;
  }

  T _resolveScopedDescriptor<T>(ServiceDescriptor descriptor) {
    if (descriptor.lifetime == ServiceLifetime.singleton) {
      return super.get<T>(); // use root provider logic
    }

    if (descriptor.lifetime == ServiceLifetime.scoped) {
      if (_scopedInstances.containsKey(descriptor.type)) {
        return _scopedInstances[descriptor.type] as T;
      }
      final instance = createInstance(descriptor);
      _scopedInstances[descriptor.type] = instance;
      return instance as T;
    }

    // transient
    return createInstance(descriptor) as T;
  }

  void dispose() {
    for (final instance in _scopedInstances.values) {
      if (instance is Disposable) {
        instance.dispose();
      }
    }
    _scopedInstances.clear();
  }
}
