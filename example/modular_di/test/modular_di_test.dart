import 'package:test/test.dart';
import 'package:force_inject/force_inject.dart';
import '../lib/modules/auth_module.dart';
import '../lib/services/user_service.dart';

void main() {
  test('AuthModule should register UserService with dependency', () {
    final services = ServiceCollection()..addModule(AuthModule());
    final provider = services.buildServiceProvider();

    final userService = provider.get<UserService>();

    expect(userService.userData, contains('auth-token-123'));
  });
}
