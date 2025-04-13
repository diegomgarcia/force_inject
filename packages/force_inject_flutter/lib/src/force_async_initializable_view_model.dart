import 'package:flutter/widgets.dart';

abstract class ForceAsyncInitializableViewModel {
  Future<void> initAsync(BuildContext context);
}
