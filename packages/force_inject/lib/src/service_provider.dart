import 'service_descriptor.dart';
import 'service_lifetime.dart';
import 'service_scope.dart';
import 'internal_types.dart';
import 'package:meta/meta.dart';

class ServiceProvider {
  @protected
  final Map<Type, ServiceDescriptor> descriptors;

  final Map<Type, Object> _singletons = {};

  ServiceProvider(List<ServiceDescriptor> descriptors)
      : descriptors = {for (var d in descriptors) d.type: d};

  @protected
  ServiceProvider.internal(this.descriptors); // for scoped use

  T get<T>() {
    final descriptor = descriptors[T];
    if (descriptor == null) {
      throw Exception("Service of type $T is not registered");
    }

    if (descriptor.lifetime == ServiceLifetime.scoped) {
      throw Exception(
          "Service of type $T has a scoped lifetime and must be resolved from a ServiceScope.");
    }

    if (descriptor.lifetime == ServiceLifetime.singleton) {
      if (_singletons.containsKey(T)) {
        return _singletons[T] as T;
      }
      final instance = createInstance(descriptor);
      _singletons[T] = instance;
      return instance as T;
    }

    return createInstance(descriptor) as T;
  }

  @protected
  Object createInstance(ServiceDescriptor descriptor) {
    if (descriptor.instance != null) {
      return descriptor.instance!;
    }

    final implType = descriptor.implementationType;
    final constructor = _typeConstructors[implType];
    if (constructor == null) {
      throw Exception("No constructor registered for $implType");
    }

    final parameters = constructor.parameters.map((paramType) {
      return getByType(paramType);
    }).toList();

    return Function.apply(constructor.constructor, parameters);
  }

  Object getByType(Type type) {
    final descriptor = descriptors[type];
    if (descriptor == null) {
      throw Exception("Type $type is not registered");
    }

    if (descriptor.lifetime == ServiceLifetime.singleton &&
        _singletons.containsKey(type)) {
      return _singletons[type]!;
    }

    final implType = descriptor.implementationType;
    final constructor = _typeConstructors[implType];
    if (constructor == null) {
      throw Exception("No constructor registered for $implType");
    }

    final parameters = constructor.parameters.map((param) {
      return getByType(param);
    }).toList();

    final instance = Function.apply(constructor.constructor, parameters);

    if (descriptor.lifetime == ServiceLifetime.singleton) {
      _singletons[type] = instance;
    }

    return instance;
  }

  ServiceScope createScope() {
    return ServiceScope(this);
  }

  // === Constructor registration system ===

  static final Map<Type, ConstructorBinding> _typeConstructors = {};

  static void registerConstructor<T>(
      Function constructor, List<Type> paramTypes) {
    _typeConstructors[T] = ConstructorBinding(constructor, paramTypes);
  }
}
