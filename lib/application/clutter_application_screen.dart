import 'package:clutter/application/clutter_application_screen_keys.dart';
import 'package:clutter/features/settings/settings_screen.dart';
import 'package:clutter/features/tmdb/ui/movies/movies_presenter.dart';
import 'package:clutter/navigation/page_route.dart';
import 'package:clutter/ui_kit/clutter_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClutterApplicationScreen extends StatelessWidget {
  const ClutterApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildLandingScreen(context);
  }

  _buildLandingScreen(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _screenPositionedWidget(
            context,
            key: ClutterApplicationScreenKeys().clutterScreenSettingsKey,
            top: kToolbarHeight,
            right: 20,
            icon: settingsIcon,
            height: 40.0,
            width: 40.0,
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
            onTap: () => pushWidgetWithFade(
              context,
              const SettingsScreen(),
            ),
          ),
          _screenPositionedWidget(
            context,
            // left: MediaQuery.of(context).size.width / 2 - 30,
            key: ClutterApplicationScreenKeys().clutterScreenTMDBKey,
            top: 130,
            left: 20,
            title: 'TMDB',
            height: 240.0,
            width: 240.0,
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
            borderColor: Theme.of(context).colorScheme.onPrimary,
            borderWidth: 2.0,
            onTap: () => {
              pushWidgetWithFade(
                context,
                const MoviesPresenter(),
              ),
            },
          ),
        ],
      ),
    );
  }

  Positioned _screenPositionedWidget(
    BuildContext context, {
    double? borderWidth,
    double? circleRadius,
    Color? borderColor,
    Key? key,
    double? top,
    double? bottom,
    double? left,
    double? right,
    VoidCallback? onTap,
    String? title,
    String? icon,
    double? height,
    double? width,
    Color? backgroundColor,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) {
    return Positioned(
      key: key,
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: borderWidth ?? 0.0,
              color: borderColor ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(circleRadius ?? 200.0),
            color: backgroundColor,
            // shape: BoxShape.circle,
          ),
          width: width,
          height: height,
          margin: margin,
          padding: padding,
          child: Center(
            child: title != null
                ? Text(
                    title,
                    style: Theme.of(context).textTheme.button,
                    textAlign: TextAlign.center,
                  )
                : SvgPicture.asset(
                    icon ?? '',
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
          ),
        ),
      ),
    );
  }
}
