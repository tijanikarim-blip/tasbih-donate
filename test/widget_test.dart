import 'package:flutter_test/flutter_test.dart';
import 'package:tasbih_donate/main.dart';

void main() {
  testWidgets('App launches smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const TasbihDonateApp());
    expect(find.byType(TasbihDonateApp), findsOneWidget);
  });
}
