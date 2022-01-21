import 'package:flutter/material.dart';

class TmdbLandingWidget extends StatelessWidget {
  const TmdbLandingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
      ),
      body: const Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}
