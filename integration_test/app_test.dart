import 'package:flutter_test/flutter_test.dart';
import 'package:hello_flutter/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // この単位でテストを実行する。
  group('E2E テスト', () {
    testWidgets('ページ遷移をテストする。', (tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('Test Page 1'), findsOneWidget);
      expect(find.text('Test Page '), findsNothing);

      await tester.tap(find.text('進む'));
      await tester.pumpAndSettle();

      expect(find.text('Test Page 2'), findsOneWidget);
      expect(find.text('Test Page 1'), findsNothing);

      await tester.tap(find.text('進む'));
      await tester.pumpAndSettle();

      expect(find.text('Test Page 3'), findsOneWidget);
      expect(find.text('Test Page 2'), findsNothing);

      await tester.tap(find.text('戻る'));
      await tester.pumpAndSettle();

      expect(find.text('Test Page 2'), findsOneWidget);
      expect(find.text('Test Page 3'), findsNothing);

      await tester.tap(find.text('戻る'));
      await tester.pumpAndSettle();

      expect(find.text('Test Page 1'), findsOneWidget);
      expect(find.text('Test Page 2'), findsNothing);
    });
  });
}
