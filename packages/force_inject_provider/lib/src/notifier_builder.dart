import 'package:flutter/material.dart';
import 'provider_scope.dart';

class ProviderNotifierBuilder<T extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(BuildContext context, T viewModel, Widget? child) builder;
  final Widget? child;

  const ProviderNotifierBuilder({
    super.key,
    required this.builder,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final scope = ProviderScope.of(context);
    final viewModel = scope.get<T>();

    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) => builder(context, viewModel, child),
      child: child,
    );
  }
}
