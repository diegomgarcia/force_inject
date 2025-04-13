import 'package:flutter/widgets.dart';
import 'package:force_inject/force_inject.dart';
import 'package:force_inject_flutter/force_inject_flutter.dart';

class User {
  final String name;
  User(this.name);
}

class AuthViewModel implements ForceAsyncInitializableViewModel, Disposable {
  User? user;
  bool shouldFail = false;

  @override
  Future<void> initAsync(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (shouldFail) throw Exception('Login failed');
    user = User('Diego Garcia');
  }

  @override
  void dispose() {
    print('[AuthViewModel] Disposed');
  }
}
