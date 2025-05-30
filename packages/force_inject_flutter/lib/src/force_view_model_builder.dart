import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'force_async_initializable_view_model.dart';
import 'force_initializable_view_model.dart';
import 'force_scope_widget.dart';

/// A widget that injects a ViewModel from the current ForceScope and rebuilds
/// when the ViewModel notifies (if it's a ValueListenable).
class ForceViewModelBuilder<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel) builder;
  final Widget Function(BuildContext context)? loadingBuilder;
  final Widget Function(BuildContext context, Object error)? errorBuilder;
  final void Function(T viewModel)? onInitComplete;
  final void Function(Object error)? onInitError;
  final void Function(T viewModel)? onDispose;
  final void Function(T viewModel)? onPrepareViewModel;

  const ForceViewModelBuilder({
    super.key,
    required this.builder,
    this.onDispose,
    this.onPrepareViewModel,
    this.onInitComplete,
    this.onInitError,
    this.loadingBuilder,
    this.errorBuilder,
  });

  @override
  State<ForceViewModelBuilder<T>> createState() =>
      _ForceViewModelBuilderState<T>();
}

class _ForceViewModelBuilderState<T> extends State<ForceViewModelBuilder<T>> {
  late final T _viewModel;
  Object? _error;
  bool _initialized = false;
  bool _loading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_initialized) return;

    _viewModel = ForceScopeWidget.of(context).get<T>();

    final vm = _viewModel!;
    _initialized = true;

    widget.onPrepareViewModel?.call(vm);

    if (vm is ForceInitializableViewModel) {
      vm.init(context);
    }

    if (vm is ForceAsyncInitializableViewModel) {
      _loading = true;

      vm.initAsync(context).then((_) {
        if (!mounted) return;
        setState(() {
          _loading = false;
        });
        widget.onInitComplete?.call(vm);
      }).catchError((err) {
        if (!mounted) return;
        setState(() {
          _error = err;
          _loading = false;
        });
        widget.onInitError?.call(err);
      });
    }
  }

  @override
  void dispose() {
    if (_viewModel != null) {
      widget.onDispose?.call(_viewModel);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = _viewModel;

    if (_error != null && widget.errorBuilder != null) {
      return widget.errorBuilder!(context, _error!);
    }

    if (_loading && vm is ForceAsyncInitializableViewModel) {
      return widget.loadingBuilder?.call(context) ?? const SizedBox.shrink();
    }

    if (vm is ValueListenable) {
      return ValueListenableBuilder(
        valueListenable: vm as ValueListenable,
        builder: (context, _, __) => widget.builder(context, vm),
      );
    }

    return widget.builder(context, vm!);
  }
}
