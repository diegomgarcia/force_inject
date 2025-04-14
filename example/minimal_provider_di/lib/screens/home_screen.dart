import 'package:flutter/material.dart';
import 'package:force_inject_provider/force_inject_provider.dart';
import '../viewmodels/counter_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider DI')),
      body: Center(
        child: ProviderNotifierBuilder<CounterViewModel>(
          builder: (context, vm, _) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Count: ${vm.count}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: vm.increment,
                child: const Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
