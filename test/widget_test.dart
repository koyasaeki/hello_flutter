import 'package:flutter_test/flutter_test.dart';

import 'package:hello_flutter/main.dart';

void main() {
  testWidgets('ウィジェットテスト', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Test Page 1'), findsOneWidget);
    expect(find.text('Test Page 2'), findsNothing);
  });
}
