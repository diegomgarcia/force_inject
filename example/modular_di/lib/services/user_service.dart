import 'auth_service.dart';

class UserService {
  final AuthService auth;

  UserService(this.auth);

  String get userData => 'User loaded with token: ${auth.token}';
}
