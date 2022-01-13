import 'package:clutter/application/clutter_application.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Counter increments smoke test',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const ClutterApplication());

      // Verify that our counter starts at 0.
      expect(find.text('Clutter Application'), findsOneWidget);
    },
  );
}
