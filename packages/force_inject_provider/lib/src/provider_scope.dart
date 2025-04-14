import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:force_inject/force_inject.dart';

class ProviderScope extends StatefulWidget {
  final Widget child;
  final ServiceScope Function() create;
  final void Function(ServiceScope)? onDispose;

  const ProviderScope({
    super.key,
    required this.create,
    required this.child,
    this.onDispose,
  });

  @override
  State<ProviderScope> createState() => _ProviderScopeState();

  static ServiceScope of(BuildContext context) {
    return Provider.of<ServiceScope>(context, listen: false);
  }
}

class _ProviderScopeState extends State<ProviderScope> {
  late final ServiceScope _scope;

  @override
  void initState() {
    super.initState();
    _scope = widget.create();
  }

  @override
  void dispose() {
    widget.onDispose?.call(_scope);
    _scope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<ServiceScope>.value(
      value: _scope,
      child: widget.child,
    );
  }
}
