import 'package:flutter_test/flutter_test.dart';
import 'package:moneylog/main.dart';

void main() {
  testWidgets('Budget app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const BudgetApp());

    expect(find.text('Budget'), findsOneWidget);
    expect(find.text('Budget App'), findsOneWidget);
  });
}