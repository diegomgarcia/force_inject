import 'package:flutter/widgets.dart';
import 'package:force_inject/force_inject.dart';
import 'package:force_inject_flutter/force_inject_flutter.dart';

class HomeViewModel implements ForceInitializableViewModel, Disposable {
  late Locale locale;

  @override
  void init(BuildContext context) {
    locale = Localizations.localeOf(context);
    print('[HomeViewModel] Initialized with locale: ${locale.languageCode}');
  }

  @override
  void dispose() {
    print('[HomeViewModel] Disposed.');
  }
}
