import 'package:async_viewmodel_flutter_di/viewmodels/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:async_viewmodel_flutter_di/main.dart';
import 'package:force_inject/force_inject.dart';



void main() {
  testWidgets('AuthViewModel loads and renders async result', (WidgetTester tester) async {
    final services = ServiceCollection()
      ..addScoped<AuthViewModel, AuthViewModel>();

    ServiceProvider.registerConstructor<AuthViewModel>(
          () => AuthViewModel(),
      [],
    );

    final provider = services.buildServiceProvider();

    // Load the app
    await tester.pumpWidget(MyApp(provider));

    // Should initially show the loading indicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for async init (2s delay simulated in ViewModel)
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Verify final UI renders expected result
    expect(find.textContaining('Welcome Diego Garcia'), findsOneWidget);
  });

  testWidgets('AuthViewModel handles async failure gracefully', (WidgetTester tester) async {
    // Override MyApp to inject a failing ViewModel
    await tester.pumpWidget(MyAppWithFailingViewModel());

    // Should initially show loading indicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for simulated failure
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Should now show an error message
    expect(find.textContaining('Error: Exception: Login failed'), findsOneWidget);
  });
}
