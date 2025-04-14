import 'package:force_inject/force_inject.dart';
import '../viewmodels/counter_viewmodel.dart';

ServiceProvider configureServices() {
  final services = ServiceCollection();

  services.addScoped<CounterViewModel, CounterViewModel>();

  ServiceProvider.registerConstructor<CounterViewModel>(
        () => CounterViewModel(),
    [],
  );

  return services.buildServiceProvider();
}
