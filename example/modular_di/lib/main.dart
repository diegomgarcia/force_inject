import 'package:force_inject/force_inject.dart';
import 'modules/auth_module.dart';
import 'services/user_service.dart';

void main() {
  final services = ServiceCollection()..addModule(AuthModule());
  final provider = services.buildServiceProvider();

  final userService = provider.get<UserService>();
  print(userService.userData);
}
