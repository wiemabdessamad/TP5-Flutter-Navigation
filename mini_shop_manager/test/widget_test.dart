import 'package:flutter_test/flutter_test.dart';
import 'package:mini_shop_manager/main.dart';

void main() {
  testWidgets('MiniShop Manager démarre', (WidgetTester tester) async {
    await tester.pumpWidget(const MiniShopApp());

    expect(find.text('Catalogue MiniShop'), findsOneWidget);
    expect(find.text('Téléphone'), findsOneWidget);
  });
}