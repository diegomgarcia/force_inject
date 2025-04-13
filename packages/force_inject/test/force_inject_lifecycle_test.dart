import 'package:test/test.dart';
import 'package:force_inject/force_inject.dart';

class TestService implements Initializable, Disposable {
  bool initialized = false;
  bool disposed = false;

  @override
  void init() {
    initialized = true;
  }

  @override
  void dispose() {
    disposed = true;
  }
}

void main() {
  group('ForceInject lifecycle', () {
    test('should call init and dispose for scoped service', () {
      final services = ServiceCollection();

      services.addScoped<TestService, TestService>();
      ServiceProvider.registerConstructor<TestService>(
            () => TestService(),
        [],
      );

      final root = services.buildServiceProvider();
      final scope = root.createScope();

      final instance = scope.get<TestService>();

      expect(instance.initialized, isTrue);
      expect(instance.disposed, isFalse);

      scope.dispose();

      expect(instance.disposed, isTrue);
    });
  });
}
