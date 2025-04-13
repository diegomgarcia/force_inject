import 'package:force_inject/force_inject.dart';
import '../services/auth_service.dart';
import '../services/user_service.dart';

class AuthModule implements ForceInjectModule {
  @override
  void registerServices(ServiceCollection services) {
    services
      ..addSingleton<AuthService, AuthService>()
      ..addTransient<UserService, UserService>();
  }

  @override
  void registerConstructors() {
    ServiceProvider.registerConstructor<AuthService>(() => AuthService(), []);

    ServiceProvider.registerConstructor<UserService>(
          (AuthService auth) => UserService(auth),
      [AuthService],
    );
  }
}
