import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:force_inject/force_inject.dart';
import 'package:force_inject_flutter/force_inject_flutter.dart';

class TestViewModel implements ForceInitializableViewModel, Disposable {
  bool initialized = false;
  bool disposed = false;
  late BuildContext receivedContext;

  @override
  void init(BuildContext context) {
    initialized = true;
    receivedContext = context;
  }

  @override
  void dispose() {
    disposed = true;
  }
}

void main() {
  group('ForceViewModelBuilder Lifecycle', () {
    late ServiceProvider provider;

    setUp(() {
      final services = ServiceCollection();
      services.addScoped<TestViewModel, TestViewModel>();

      ServiceProvider.registerConstructor<TestViewModel>(
            () => TestViewModel(),
        [],
      );

      provider = services.buildServiceProvider();
    });

    testWidgets('calls init(context) and dispose()', (tester) async {
      late TestViewModel instance;

      await tester.pumpWidget(
        ForceScopeWidget(
          provider: provider.createScope(),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ForceViewModelBuilder<TestViewModel>(
              builder: (context, vm) {
                instance = vm;
                return const Placeholder();
              },
            ),
          ),
        ),
      );

      await tester.pump(); // Let post-frame callback execute

      expect(instance.initialized, isTrue);
      expect(instance.receivedContext, isNotNull);
      expect(instance.disposed, isFalse);

      // Trigger widget disposal
      await tester.pumpWidget(const SizedBox.shrink());

      expect(instance.disposed, isTrue);
    });
  });
}
