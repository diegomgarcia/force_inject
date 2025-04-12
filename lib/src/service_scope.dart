import 'service_provider.dart';
import 'service_lifetime.dart';

class ServiceScope extends ServiceProvider {
  final Map<Type, Object> _scopedInstances = {};

  ServiceScope(ServiceProvider parent) : super.internal(parent.descriptors);

  @override
  T get<T>() {
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

  void dispose() {
    _scopedInstances.clear(); // Optional: add .dispose() hooks in the future
  }
}
