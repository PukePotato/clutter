import 'package:clutter/application/clutter_application_screen.dart';
import 'package:clutter/application/clutter_application_screen_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../core/test_app_wrapper.dart';

GlobalKey<NavigatorState> mockNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  testWidgets(
    'Clutter Application Test',
    (WidgetTester widgetTester) async {
      TestAppWrapper widget = TestAppWrapper(
        Material(
          child: Navigator(
            key: mockNavigatorKey,
            onGenerateRoute: (routeSettings) {
              return MaterialPageRoute(
                builder: (context) => const ClutterApplicationScreen(),
                maintainState: false,
              );
            },
          ),
        ),
      );
      await widgetTester.pumpWidget(widget);
      await widgetTester.pumpAndSettle();

      Finder settingsWidget = find.byKey(ClutterApplicationScreenKeys().clutterScreenSettingsKey);
      expect(settingsWidget, findsOneWidget);
      await widgetTester.tap(settingsWidget);
      await widgetTester.pump();

      expect(find.byKey(ClutterApplicationScreenKeys().clutterScreenTMDBKey), findsOneWidget);

      // await widgetTester.dragUntilVisible(
      //   welcomeWidget, // what you want to find
      //   find.byType(SingleChildScrollView), // widget you want to scroll
      //   const Offset(370.0, 56.0), // delta to move
      // );

      // expect(welcomeWidget, findsOneWidget);
      // await widgetTester.tap(welcomeWidget);
      // await widgetTester.pump();

      // Finder demoWidget = find.byKey(ClutterWidgetKeys().clutterScreenDemoKey);
      // expect(demoWidget, findsOneWidget);
      // await widgetTester.tap(demoWidget);
      // await widgetTester.pump();
    },
  );
}
