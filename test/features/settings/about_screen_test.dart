import 'package:clutter/features/settings/about_screen.dart';
import 'package:clutter/features/settings/about_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../core/test_app_wrapper.dart';

void main() {
  GlobalKey<NavigatorState> mockNavigatorKey = GlobalKey<NavigatorState>();

  testWidgets(
    'AboutScreen Tests',
    (WidgetTester tester) async {
      TestAppWrapper widget = TestAppWrapper(
        Material(
          child: Navigator(
            key: mockNavigatorKey,
            onGenerateRoute: (routeSettings) {
              return MaterialPageRoute(
                builder: (context) => const AboutScreen(),
                maintainState: false,
              );
            },
          ),
        ),
      );

      await tester.pumpWidget(widget);
      expect(find.byType(AboutScreen), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text(AboutStrings.aboutDescription), findsOneWidget);
      expect(find.text(AboutStrings.authorName), findsOneWidget);
      expect(find.text(AboutStrings.aboutGithubContent), findsOneWidget);
      expect(find.text('Flutter'), findsOneWidget);

      // expect(await canLaunch(flutterUrl), true);
    },
  );
}
