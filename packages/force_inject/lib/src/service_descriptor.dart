import 'service_lifetime.dart';
import 'service_provider.dart';

class ServiceDescriptor {
  final Type type;
  final Type implementationType;
  final ServiceLifetime lifetime;
  final Object? instance;
  final Object Function(ServiceProvider)? factory;

  final Object? name;
  final Object? tag;

  ServiceDescriptor({
    required this.type,
    required this.implementationType,
    required this.lifetime,
    this.instance,
    this.factory,
    this.name,
    this.tag,
  });
}
