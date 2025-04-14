import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_provider_di/main.dart';
import 'package:minimal_provider_di/di/service_config.dart';

void main() {
  testWidgets('Counter increments test', (WidgetTester tester) async {
    final provider = configureServices();

    await tester.pumpWidget(MyApp(serviceProvider: provider));

    expect(find.text('Count: 0'), findsOneWidget);
    expect(find.text('Count: 1'), findsNothing);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Count: 1'), findsOneWidget);
  });
}
