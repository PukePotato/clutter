import 'package:flutter/material.dart';

class DynamicTheme {
  // static const _darkFillColor = Colors.white;
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData darkTheme = _dynamicThemeData(_darkColorScheme, _darkFocusColor);
  static ThemeData lightTheme = _dynamicThemeData(_lightColorScheme, _lightFocusColor);

  static ThemeData _dynamicThemeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      // snackBarTheme: SnackBarThemeData(
      //   behavior: SnackBarBehavior.floating,
      //   backgroundColor: Color.alphaBlend(
      //     _darkFillColor.withOpacity(0.80),
      //     _darkFillColor,
      //   ),
      //   contentTextStyle: _textTheme.subtitle1?.apply(color: _darkFillColor),
      // ),
    );
  }

  static const ColorScheme _darkColorScheme = ColorScheme(
    primary: Color(0xff2196f3),
    primaryVariant: Color(0xff000000),
    secondary: Color(0xff64ffda),
    secondaryVariant: Color(0xff00bfa5),
    surface: Color(0xff424242),
    background: Color(0xff616161),
    error: Color(0xffd32f2f),
    onPrimary: Color(0xffffffff),
    onSecondary: Color(0xff000000),
    onSurface: Color(0xffffffff),
    onBackground: Color(0xffffffff),
    onError: Color(0xff000000),
    brightness: Brightness.dark,
  );

  static const ColorScheme _lightColorScheme = ColorScheme(
    primary: Color(0xff2196f3),
    primaryVariant: Color(0xff1976d2),
    secondary: Color(0xff2196f3),
    secondaryVariant: Color(0xff1976d2),
    surface: Color(0xffffffff),
    background: Color(0xffffffff),
    error: Color(0xffd32f2f),
    onPrimary: Color(0xffffffff),
    onSecondary: Color(0xffffffff),
    onSurface: Color(0xff000000),
    onBackground: Color(0xffffffff),
    onError: Color(0xffffffff),
    brightness: Brightness.light,
  );

  static const TextTheme _textTheme = TextTheme(
    headline1: TextStyle(
      // color: Color(0xb3ffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Raleway',
    ),
    headline2: TextStyle(
      // color: Color(0xb3ffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Raleway',
    ),
    headline3: TextStyle(
      // color: Color(0xb3ffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Raleway',
    ),
    headline4: TextStyle(
      // color: Color(0xb3ffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Raleway',
    ),
    headline5: TextStyle(
      // color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Raleway',
    ),
    headline6: TextStyle(
      // color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Raleway',
    ),
    subtitle1: TextStyle(
      // color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Raleway',
    ),
    subtitle2: TextStyle(
      // color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Raleway',
    ),
    bodyText1: TextStyle(
      // color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Raleway',
    ),
    bodyText2: TextStyle(
      // color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Raleway',
    ),
    caption: TextStyle(
      // color: Color(0xb3ffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Raleway',
    ),
    button: TextStyle(
      // color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Raleway',
    ),
    overline: TextStyle(
      // color: Color(0xffffffff),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'Raleway',
    ),
  );
}
