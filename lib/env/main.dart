import 'package:clutter/application/clutter_application.dart';
import 'package:clutter/core/base_bloc_observer.dart';
import 'package:clutter/env/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  AppConfig();
  BlocOverrides.runZoned(
    () => runApp(
      const ClutterApplication(),
    ),
    blocObserver: ClutterObserver(),
  );
}

class AppConfig {
  AppConfig() {
    Endpoints.tmdbBaseUrl = 'https://api.themoviedb.org/3';
    Endpoints.posterEndpoint = 'https://image.tmdb.org/t/p/w500/';

    // SystemChrome.setSystemUIOverlayStyle(
    //       SystemUiOverlayStyle(
    //         statusBarColor: Color(0xffffffff), //top bar color
    //         statusBarIconBrightness: Brightness.dark, //top bar icons
    //         systemNavigationBarColor: Color(0xffffffff), //bottom bar color
    //         systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons
    //       ),
    //     );
  }
}
