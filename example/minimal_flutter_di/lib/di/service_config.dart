import 'package:force_inject/force_inject.dart';
import '../viewmodels/counter_viewmodel.dart';

final services = ServiceCollection()
  ..addScoped<CounterViewModel, CounterViewModel>();

void setupDI() {
  ServiceProvider.registerConstructor<CounterViewModel>(
        () => CounterViewModel(),
    [],
  );
}
