import 'package:flutter/widgets.dart';
import 'package:force_inject/force_inject.dart';

/// Provides a ServiceScope to its widget subtree and disposes it automatically.
///
/// You must provide a root ServiceProvider to create the scope from.
class ForceScopeWidget extends StatefulWidget {
  final ServiceProvider provider;
  final Widget child;

  const ForceScopeWidget({
    super.key,
    required this.provider,
    required this.child,
  });

  @override
  State<ForceScopeWidget> createState() => _ForceScopeWidgetState();

  /// Access the current [ServiceScope] from the widget [context].
  static ServiceScope of(BuildContext context) {
    final inherited =
        context.dependOnInheritedWidgetOfExactType<_ForceScopeProvider>();
    assert(inherited != null, 'No ForceScopeWidget found in context');
    return inherited!.scope;
  }
}

class _ForceScopeWidgetState extends State<ForceScopeWidget> {
  late final ServiceScope _scope;

  @override
  void initState() {
    super.initState();
    _scope = widget.provider.createScope();
  }

  @override
  void dispose() {
    _scope.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _ForceScopeProvider(
      scope: _scope,
      child: widget.child,
    );
  }
}

class _ForceScopeProvider extends InheritedWidget {
  final ServiceScope scope;

  const _ForceScopeProvider({
    required this.scope,
    required super.child,
  });

  @override
  bool updateShouldNotify(_ForceScopeProvider oldWidget) => false;
}
