
import 'package:flutter/widgets.dart';
import 'package:force_inject/force_inject.dart';

/// A placeholder widget that will manage a scoped lifetime in the future.
class ForceScopeWidget extends StatefulWidget {
  final WidgetBuilder builder;

  const ForceScopeWidget({super.key, required this.builder});

  @override
  State<ForceScopeWidget> createState() => _ForceScopeWidgetState();
}

class _ForceScopeWidgetState extends State<ForceScopeWidget> {
  late final ServiceScope scope;

  @override
  void initState() {
    super.initState();
    // This will be injected in the future with a global or parent provider
    throw UnimplementedError('ForceScopeWidget must receive a provider');
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  @override
  void dispose() {
    // scope.dispose(); ← we'll hook this up later
    super.dispose();
  }
}
