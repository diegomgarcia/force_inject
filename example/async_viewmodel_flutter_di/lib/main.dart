import 'package:flutter/material.dart';
import 'package:force_inject/force_inject.dart';
import 'package:force_inject_flutter/force_inject_flutter.dart';
import 'di/service_config.dart';
import 'screens/auth_screen.dart';
import 'viewmodels/auth_view_model.dart';

void main() {
  configureConstructors();
  final provider = services.buildServiceProvider();

  runApp(MyApp(provider));
}

class MyApp extends StatelessWidget {
  final ServiceProvider provider;

  const MyApp(this.provider, {super.key});

  @override
  Widget build(BuildContext context) {
    return ForceScopeWidget(
      provider: provider.createScope(),
      child: const MaterialApp(
        home: AuthScreen(),
      ),
    );
  }
}

class MyAppWithFailingViewModel extends StatelessWidget {
  MyAppWithFailingViewModel({super.key}) {
    // Override registration with a failing instance
    services.addScoped<AuthViewModel, AuthViewModel>();

    ServiceProvider.registerConstructor<AuthViewModel>(
          () {
        final vm = AuthViewModel();
        vm.shouldFail = true; // Trigger async failure
        return vm;
      },
      [],
    );
  }

  final ServiceProvider _provider = services.buildServiceProvider();

  @override
  Widget build(BuildContext context) {
    return ForceScopeWidget(
      provider: _provider.createScope(),
      child: const MaterialApp(
        home: AuthScreen(),
      ),
    );
  }
}
