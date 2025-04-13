import 'package:flutter/material.dart';
import 'di/service_config.dart';
import 'screens/home_screen.dart';

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
      title: 'ForceInject Flutter Demo',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: HomeScreen(provider: provider),
    );
  }
}
