import 'package:flutter_test/flutter_test.dart';

import 'package:tarotscore_v2/tarot_score_app.dart';

void main() {
  testWidgets('Application démarre', (WidgetTester tester) async {
    await tester.pumpWidget(
      const TarotScoreApp(),
    );

    expect(find.text('TarotScore V2'), findsOneWidget);
  });
}