import 'package:force_inject/force_inject.dart';

class LoggingService implements Initializable, Disposable {
  @override
  void init() {
    print('[LoggingService] Initialized');
  }

  @override
  void dispose() {
    print('[LoggingService] Disposed');
  }

  void doSomething() {
    print('[LoggingService] Doing something important.');
  }
}

void main() {
  final services = ServiceCollection();

  services.addScoped<LoggingService, LoggingService>();

  ServiceProvider.registerConstructor<LoggingService>(
        () => LoggingService(),
    [],
  );

  final provider = services.buildServiceProvider();
  final scope = provider.createScope();

  final logger = scope.get<LoggingService>();
  logger.doSomething();

  scope.dispose(); // Should print: "[LoggingService] Disposed"
}
