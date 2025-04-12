import 'package:flutter/material.dart';
import 'package:force_inject_flutter/force_inject_flutter.dart';
import '../viewmodels/counter_viewmodel.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scoped DI Example')),
      body: Center(
        child: ForceViewModelBuilder<CounterViewModel>(
          builder: (context, viewModel) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: viewModel.count,
                  builder: (_, value, __) => Text(
                    'Count: $value',
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: viewModel.increment,
                  child: const Text('Increment'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
