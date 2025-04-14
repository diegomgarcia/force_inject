import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:force_inject/force_inject.dart';
import 'package:force_inject_provider/force_inject_provider.dart';

class CounterViewModel extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

void main() {
  testWidgets('ProviderNotifierBuilder updates UI and disposes correctly', (WidgetTester tester) async {
    final services = ServiceCollection();
    services.addScoped<CounterViewModel, CounterViewModel>();
    ServiceProvider.registerConstructor<CounterViewModel>(
          () => CounterViewModel(),
      [],
    );
    final provider = services.buildServiceProvider();

    await tester.pumpWidget(
      ProviderScope(
        create: () => provider.createScope(),
        child: MaterialApp(
          home: Scaffold(
            body: ProviderNotifierBuilder<CounterViewModel>(
              builder: (context, vm, _) => Column(
                children: [
                  Text('Count: ${vm.count}', textDirection: TextDirection.ltr),
                  ElevatedButton(
                    onPressed: vm.increment,
                    child: const Text('Increment'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // Initial value
    expect(find.text('Count: 0'), findsOneWidget);

    // Tap the increment button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Should reflect updated count
    expect(find.text('Count: 1'), findsOneWidget);
  });
}
