import 'package:clutter/ui_kit/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ClutterApplication extends StatelessWidget {
  const ClutterApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) {
        return AppLocalizations.of(context)!.appTitle;
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
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
          if (locale.languageCode == locales?.languageCode && locale.countryCode == locales?.countryCode) {
            return locale;
          }
          return supportedLocales.first;
        }
      },
      theme: DynamicTheme.darkTheme,
      home: const SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingTitle),
      ),
      body: const Center(
        child: Text('Clutter'),
      ),
    );
  }
}
