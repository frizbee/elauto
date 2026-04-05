import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:elauto/main.dart';

void main() {
  testWidgets('splash shows logo image', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashScreen()));

    expect(find.byType(Image), findsOneWidget);
  });
}
