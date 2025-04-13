import 'package:force_inject/force_inject.dart';
import '../viewmodels/auth_view_model.dart';

final services = ServiceCollection()
  ..addScoped<AuthViewModel, AuthViewModel>();

void configureConstructors() {
  ServiceProvider.registerConstructor<AuthViewModel>(
        () => AuthViewModel(),
    [],
  );
}
