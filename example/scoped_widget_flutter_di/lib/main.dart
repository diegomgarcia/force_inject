import 'package:flutter/material.dart';
import 'package:force_inject/force_inject.dart';
import 'package:force_inject_flutter/force_inject_flutter.dart';
import 'di/service_config.dart';
import 'screens/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    setupDI();
    final provider = services.buildServiceProvider();

    return MaterialApp(
      title: 'Scoped Widget DI Demo',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: ForceScopeWidget(
        provider: provider,
        child: const CounterScreen(),
      ),
    );
  }
}
