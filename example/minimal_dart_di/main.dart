// Add this into your real project
import 'package:force_inject/force_inject.dart';

abstract class ILogger {
  void log(String msg);
}

class ConsoleLogger implements ILogger {
  @override
  void log(String msg) {
    print('[LOG] $msg');
  }
}

class UserService {
  final ILogger logger;
  UserService(this.logger);

  void sayHello() {
    logger.log("Hello from UserService!");
  }
}

void main() {
  final services = ServiceCollection();

  services.addSingleton<ILogger, ConsoleLogger>();
  services.addTransient<UserService, UserService>();

  ServiceProvider.registerConstructor<ConsoleLogger>(() => ConsoleLogger(), []);
  ServiceProvider.registerConstructor<UserService>(
    (ILogger logger) => UserService(logger),
    [ILogger],
  );

  final provider = services.buildServiceProvider();
  final userService = provider.get<UserService>();
  userService.sayHello();
}
