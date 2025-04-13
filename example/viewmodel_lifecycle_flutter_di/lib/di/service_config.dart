import 'package:force_inject/force_inject.dart';
import '../viewmodels/home_view_model.dart';

final services = ServiceCollection()
  ..addScoped<HomeViewModel, HomeViewModel>();

void configureConstructors() {
  ServiceProvider.registerConstructor<HomeViewModel>(
        () => HomeViewModel(),
    [],
  );
}
