import 'package:clutter/env/endpoints.dart';
import 'package:clutter/features/settings/about_screen_keys.dart';
import 'package:clutter/features/settings/about_strings.dart';
import 'package:clutter/ui_kit/clutter_images.dart';
import 'package:clutter/ui_kit/clutter_text_theme.dart';
import 'package:clutter/ui_kit/sliver_app.dart';
import 'package:clutter/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  _buildContent(BuildContext context) {
    return _loadDetails(context);
  }

  _loadDetails(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
            physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                _buildSliverApp(AboutStrings.aboutTitle),
              ];
            },
            body: Container(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _authorDetails(context),
                  const SizedBox(height: 16.0),
                  Text(
                    AboutStrings.aboutDescription,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildSliverApp(String name) => SliverAppBar(
        expandedHeight: 240.0,
        title: ClutterSliverApp(
          child: Text(name),
        ),
        pinned: true,
        primary: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Container(
                  height: 90.0,
                  width: 90.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(appLogo),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    tileMode: TileMode.clamp,
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    colors: [Colors.red.withOpacity(0.6), Colors.transparent],
                    stops: const [0.0, 1.0],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  _authorDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          key: const ValueKey(AboutScreenKeys.aboutScreenAuthorKey),
          child: Text(
            AboutStrings.authorName,
            style: boldText(context),
          ),
        ),
        _buildAboutInfo(
          context,
          icon: Icons.link,
          info: AboutStrings.aboutGithubContent,
          onTap: () => launchUrl(githubUrl),
        ),
        _buildAboutInfo(
          context,
          info: 'Flutter',
          icon: Icons.link,
          onTap: () => launchUrl(flutterUrl),
        ),
      ],
    );
  }

  _buildAboutInfo(
    BuildContext context, {
    required IconData icon,
    String? info,
    Function()? onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 14.0,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(width: 60.0),
        InkWell(
          child: Text(
            info ?? '',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
