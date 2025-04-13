import 'package:flutter/material.dart';
import 'package:force_inject_flutter/force_inject_flutter.dart';
import '../viewmodels/auth_view_model.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ForceViewModelBuilder<AuthViewModel>(
      loadingBuilder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorBuilder: (_, err) => Center(
        child: Text('Error: ${err.toString()}'),
      ),
      builder: (context, vm) {
        return Scaffold(
          appBar: AppBar(title: const Text('Async Init Example')),
          body: Center(
            child: Text('Welcome ${vm.user?.name ?? 'Guest'}!'),
          ),
        );
      },
    );
  }
}
