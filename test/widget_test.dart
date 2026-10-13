import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_app/main.dart';
import 'package:portfolio_app/viewmodel/portfolio_viewmodel.dart';

void main() {
  testWidgets('Portfolio app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => PortfolioViewModel(),
        child: const PortfolioApp(),
      ),
    );
    expect(find.text('My Portfolio'), findsOneWidget);
  });
}
