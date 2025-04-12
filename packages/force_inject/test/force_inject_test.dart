import 'package:test/test.dart';
import '../lib/force_inject.dart';

abstract class Logger {
  void log(String msg);
}

class ConsoleLogger implements Logger {
  String lastMessage = '';

  @override
  void log(String msg) {
    lastMessage = msg;
  }
}

class Greeter {
  final Logger logger;
  Greeter(this.logger);

  void greet() => logger.log("Hello, test world!");
}

void main() {
  group('ForceInject', () {
    test('should resolve singleton instance', () {
      final services = ServiceCollection();

      services.addSingleton<Logger, ConsoleLogger>();
      services.addTransient<Greeter, Greeter>();

      ServiceProvider.registerConstructor<ConsoleLogger>(() => ConsoleLogger(), []);
      ServiceProvider.registerConstructor<Greeter>(
            (Logger logger) => Greeter(logger),
        [Logger],
      );

      final provider = services.buildServiceProvider();

      final greeter1 = provider.get<Greeter>();
      final greeter2 = provider.get<Greeter>();

      expect(greeter1.logger, equals(greeter2.logger)); // same logger instance
    });

    test('should resolve different transient instances', () {
      final services = ServiceCollection();

      services.addTransient<Logger, ConsoleLogger>();

      ServiceProvider.registerConstructor<ConsoleLogger>(() => ConsoleLogger(), []);

      final provider = services.buildServiceProvider();

      final logger1 = provider.get<Logger>();
      final logger2 = provider.get<Logger>();

      expect(logger1, isNot(equals(logger2))); // different instances
    });

    test('should inject dependency into constructor', () {
      final services = ServiceCollection();

      services.addSingleton<Logger, ConsoleLogger>();
      services.addTransient<Greeter, Greeter>();

      ServiceProvider.registerConstructor<ConsoleLogger>(() => ConsoleLogger(), []);
      ServiceProvider.registerConstructor<Greeter>(
            (Logger logger) => Greeter(logger),
        [Logger],
      );

      final provider = services.buildServiceProvider();

      final greeter = provider.get<Greeter>();
      greeter.greet();

      final logger = provider.get<Logger>() as ConsoleLogger;
      expect(logger.lastMessage, equals("Hello, test world!"));
    });

    test('should create and resolve scoped instances correctly', () {
      final services = ServiceCollection();

      services.addScoped<Logger, ConsoleLogger>();
      ServiceProvider.registerConstructor<ConsoleLogger>(() => ConsoleLogger(), []);

      final provider = services.buildServiceProvider();

      final scope1 = provider.createScope();
      final scope2 = provider.createScope();

      final logger1 = scope1.get<Logger>();
      final logger2 = scope1.get<Logger>();
      final logger3 = scope2.get<Logger>();

      expect(logger1, same(logger2)); // Same instance in scope1
      expect(logger1, isNot(same(logger3))); // Different from scope2
    });

    test('should throw if scoped service is resolved from root provider', () {
      final services = ServiceCollection();

      services.addScoped<Logger, ConsoleLogger>();
      ServiceProvider.registerConstructor<ConsoleLogger>(() => ConsoleLogger(), []);

      final provider = services.buildServiceProvider();

      expect(() => provider.get<Logger>(), throwsException);
    });
  });
}
