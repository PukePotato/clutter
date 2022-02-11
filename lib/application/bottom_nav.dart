import 'package:clutter/features/demo/demo_landing_widget.dart';
import 'package:clutter/features/tmdb/ui/movies/movies_presenter.dart';
import 'package:clutter/features/tmdb/ui/tmdb_landing_widget.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  List screens = [
    const DemoLandingWidget(),
    const MoviesPresenter(),
    const TmdbLandingWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            label: 'Demo',
            icon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            label: 'TMDB',
            icon: Icon(Icons.movie_filter_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Trends',
            icon: Icon(Icons.trending_up),
          ),
        ],
      ),
    );
  }
}
