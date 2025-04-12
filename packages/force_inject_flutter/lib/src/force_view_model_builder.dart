import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'force_scope_widget.dart';

/// A widget that injects a ViewModel from the current ForceScope and rebuilds
/// when the ViewModel notifies (if it's a ValueListenable).
class ForceViewModelBuilder<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel) builder;
  final void Function(T viewModel)? onDispose;

  const ForceViewModelBuilder({
    super.key,
    required this.builder,
    this.onDispose,
  });

  @override
  State<ForceViewModelBuilder<T>> createState() => _ForceViewModelBuilderState<T>();
}

class _ForceViewModelBuilderState<T> extends State<ForceViewModelBuilder<T>> {
  late final T _viewModel;

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _viewModel = ForceScopeWidget.of(context).get<T>();
      _initialized = true;
    }
  }

  @override
  void dispose() {
    widget.onDispose?.call(_viewModel);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // If it's a ValueListenable, react to changes
    if (_viewModel is ValueListenable) {
      return ValueListenableBuilder(
        valueListenable: _viewModel as ValueListenable,
        builder: (context, _, __) => widget.builder(context, _viewModel),
      );
    }

    // Otherwise, just build once
    return widget.builder(context, _viewModel);
  }
}
