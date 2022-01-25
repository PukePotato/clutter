import 'package:clutter/features/tmdb/bloc/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TmdbLandingWidget extends StatelessWidget {
  const TmdbLandingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TmdbScreen();
  }
}

class TmdbScreen extends StatefulWidget {
  const TmdbScreen({Key? key}) : super(key: key);

  @override
  State<TmdbScreen> createState() => _TmdbScreenState();
}

class _TmdbScreenState extends State<TmdbScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
      ),
      body: BlocProvider(
        create: (BuildContext context) => MoviesCubit()..fetchMovies(),
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            if (state is MovieStateLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is MovieStateLoaded) {
              final model = state.viewModel;
              return Column(
                children: [
                  Text(model.movies?.first.backdropPath ?? ''),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
