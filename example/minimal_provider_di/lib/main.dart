import 'package:flutter/material.dart';
import 'di/service_config.dart';
import 'screens/home_screen.dart';
import 'package:force_inject_provider/force_inject_provider.dart';

void main() {
  final provider = configureServices();
  runApp(MyApp(serviceProvider: provider));
}

class MyApp extends StatelessWidget {
  final ServiceProvider serviceProvider;

  const MyApp({super.key, required this.serviceProvider});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      create: () => serviceProvider.createScope(),
      child: MaterialApp(
        title: 'ForceInject + Provider Demo',
        home: const HomeScreen(),
      ),
    );
  }
}
