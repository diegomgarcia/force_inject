import 'initializable.dart';
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

  T get<T>({Object? name}) {
    if (name != null) {
      final match = descriptors.values.firstWhere(
            (d) => d.type == T && d.name == name,
        orElse: () => throw Exception("No named service '$name' for type $T."),
      );
      return _resolveDescriptor<T>(match);
    }

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

  T getTagged<T>(Object tag) {
    final match = descriptors.values.firstWhere(
          (d) => d.type == T && d.tag == tag,
      orElse: () => throw Exception("No tagged service for type $T with tag $tag."),
    );
    return _resolveDescriptor<T>(match);
  }

  List<T> getAll<T>() {
    final matches = descriptors.values.where((d) => d.type == T);
    if (matches.isEmpty) {
      throw Exception("No services registered for type $T");
    }

    return matches.map((d) => _resolveDescriptor<T>(d)).toList();
  }

  T _resolveDescriptor<T>(ServiceDescriptor descriptor) {
    if (descriptor.lifetime == ServiceLifetime.singleton) {
      if (_singletons.containsKey(descriptor)) {
        return _singletons[descriptor] as T;
      }
      final instance = createInstance(descriptor);
      _singletons[descriptor.type] = instance;
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

    final instance = Function.apply(constructor.constructor, parameters);

    if (instance is Initializable) {
      instance.init();
    }

    return instance;
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

    final instance = createInstance(descriptor);

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
