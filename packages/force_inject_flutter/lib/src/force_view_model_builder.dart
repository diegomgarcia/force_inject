import 'package:flutter/widgets.dart';

/// A placeholder for ForceViewModelBuilder — to be implemented.
class ForceViewModelBuilder<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T viewModel) builder;

  const ForceViewModelBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError('ForceViewModelBuilder<T> is not yet implemented.');
  }
}
