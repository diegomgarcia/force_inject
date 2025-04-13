import 'package:flutter/material.dart';
import 'package:force_inject/force_inject.dart';
import 'package:force_inject_flutter/force_inject_flutter.dart';
import 'di/service_config.dart';
import 'screens/home_screen.dart';

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
        home: HomeScreen(),
      ),
    );
  }
}
