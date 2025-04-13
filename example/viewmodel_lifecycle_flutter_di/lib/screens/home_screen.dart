import 'package:flutter/material.dart';
import '../viewmodels/home_view_model.dart';
import 'package:force_inject_flutter/force_inject_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ForceViewModelBuilder<HomeViewModel>(
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(title: const Text('ViewModel Lifecycle Example')),
          body: Center(
            child: Text('Locale: ${vm.locale.languageCode}'),
          ),
        );
      },
    );
  }
}
