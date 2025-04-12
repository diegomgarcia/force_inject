import 'package:flutter/material.dart';
import 'package:force_inject/force_inject.dart';
import '../viewmodels/counter_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  final ServiceProvider provider;
  const HomeScreen({super.key, required this.provider});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ServiceScope scope;
  late final CounterViewModel viewModel;

  @override
  void initState() {
    super.initState();
    scope = widget.provider.createScope();
    viewModel = scope.get<CounterViewModel>();
  }

  @override
  void dispose() {
    scope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ForceInject Demo")),
      body: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: viewModel.count,
          builder: (_, value, __) {
            return Text('Count: $value', style: const TextStyle(fontSize: 32));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
