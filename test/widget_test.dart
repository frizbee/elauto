// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:elauto/main.dart';

void main() {
  testWidgets('shows splash screen then redirects to dashboard', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ElAutoApp());

    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.byType(DashboardScreen), findsNothing);

    await tester.pump(const Duration(milliseconds: 600));

    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.byType(DashboardScreen), findsNothing);

    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(SplashScreen), findsNothing);
    expect(find.byType(DashboardScreen), findsOneWidget);
  });
}
