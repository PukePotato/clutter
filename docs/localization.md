# Flutter Localization

Localization is used to setup multiple languages in the application.

### Setting Up

Dependencies: flutter_localizations and intl package to customize the localization.

```yaml
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: ^0.17.0

flutter:
  generate: true
  uses-material-design: true
```

Run `flutter pub get`.

The `generate: true` is necessary for the automatic code generation the localization package provide
for us.

### Localization Configuration

Let's add `l10n.yaml` file to the root of the project.

The `l10n.yaml` should contain following:
```dart 
    arb-dir: lib/l10n
    template-arb-file: app_en.arb
    output-localization-file: app_localizations.dart
```

Next, in the `${FLUTTER_PROJECT}/lib/l10n` directory, add the `app_en.arb` template file.

```dart 
{
    "helloWorld": "Hello World!",
    "@helloWorld": {
      "description": "The conventional newborn programmer greeting"
    }
}
```

Next, add an `app_es.arb` file in the same directory for the spanish translation of the same message.

```dart 
{
    "helloWorld": "¡Hola Mundo!"
}
```

Finally, run the app so that codegen takes place. The generated files should be in:
`${FLUTTER_PROJECT}/.dart_tool/flutter_gen/gen_l10n`

### Using Localizations

Add the import statement on `app_localizations.dart` and `AppLocalizations.delegate` to
the constructor for `MaterialApp`.

```dart 
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

        return MaterialApp(
          title: AppLocalizations.of(context)?.appName ?? '',
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('es', ''),
            Locale('ne', ''),
          ],
          /// Hide the debug banner
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          initialRoute: Routes.initialRoute,
          routes: Routes.setUpRoutes,
          themeMode: ThemeMode.system,
          theme: ClutterTheme.clutterDarkTheme,
        );
      },
    );
  }
}
```

Use AppLocalizations anywhere in the app:
`Text(AppLocalizations.of(context).appName ?? ''`
