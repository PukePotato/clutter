import 'package:clutter/navigation/routes.dart';
import 'package:clutter/ui_kit/theme.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

/// Root class that every UI test classes is going to use

class TestAppWrapper extends StatelessWidget {
  final Widget child;

  const TestAppWrapper(
    this.child, {
    Key? key = const Key('test_app_wrapper_key'),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: DynamicTheme.darkTheme,
      initialRoute: Routes.initialRoute,
      builder: (context, child) {
        return Theme(
          data: DynamicTheme.darkTheme,
          child: child ?? this.child,
        );
      },
      home: child,
    );
  }
}
