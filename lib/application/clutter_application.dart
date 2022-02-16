import 'package:clutter/generated/i18n.dart';
import 'package:clutter/navigation/routes.dart';
import 'package:clutter/ui_kit/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class ClutterApplication extends StatelessWidget {
  const ClutterApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          /// Hide the debug banner
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          initialRoute: Routes.initialRoute,
          routes: Routes.setUpRoutes,
          onGenerateTitle: (context) {
            return S.of(context).appTitle;
          },
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('es', ''),
            Locale('ne', ''),
          ],
          localeResolutionCallback: (locales, supportedLocales) {
            for (var locale in supportedLocales) {
              if (locale.languageCode == locales?.languageCode &&
                  locale.countryCode == locales?.countryCode) {
                return locale;
              }
              return supportedLocales.first;
            }
          },
          themeMode: ThemeMode.dark,
          theme: DynamicTheme.darkTheme,
        );
      },
    );
  }
}
