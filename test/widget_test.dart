import 'package:flutter_test/flutter_test.dart';

import 'package:docs/main.dart';

void main() {
  testWidgets('Trang chủ hiển thị AppBar và danh sách app', (WidgetTester tester) async {
    await tester.pumpWidget(const DocsApp());

    expect(find.text('Điều khoản & Chính sách'), findsOneWidget);
    expect(find.text('Nông Trại Gà'), findsOneWidget);
  });
}
