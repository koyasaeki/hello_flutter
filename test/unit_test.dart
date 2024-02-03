import 'package:flutter_test/flutter_test.dart';

void main() {
  test('テスト１: 成功する', () {
    int answer = 10;
    expect(answer, 10);
  });

  test('テスト２: 失敗する', () {
    int answer = 10;
    expect(answer, 15);
  });

  test(
    'テスト３: スキップする',
    () {
      int answer = 0;
      expect(answer, 100);
    },
    skip: 'テストをスキップする理由を書く。実行時間が長すぎるとか。',
  );
}
