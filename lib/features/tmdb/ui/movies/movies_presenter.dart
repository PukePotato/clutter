import 'package:clutter/features/tmdb/bloc/movies_cubit.dart';
import 'package:clutter/features/tmdb/ui/movies/movies_screen.dart';
import 'package:clutter/features/tmdb/ui/moviw_details/movie_details_presenter.dart';
import 'package:clutter/features/tmdb/view_model/common/movie_view_model.dart';
import 'package:clutter/navigation/page_route.dart';
import 'package:clutter/ui_kit/loading_widget.dart';
import 'package:clutter/ui_kit/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesPresenter extends StatelessWidget {
  const MoviesPresenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB'),
      ),
      body: BlocProvider(
        create: (context) => MoviesCubit()..fetchMovies(),
        child: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            if (state is MovieStateLoading) {
              return const Center(
                child: LoadingWidget(),
              );
            }
            if (state is MovieStateLoaded) {
              final model = state.viewModel;
              return MoviesScreen(
                model: model.movies ?? [],
                onTapPosterItem: () {
                  _onPosterTap(
                    context,
                    model.movies ?? [],
                    model.movies?.length ?? 0,
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  _onPosterTap(
    BuildContext context,
    List<MovieViewModel> model,
    int index,
  ) {
    final MovieViewModel? movie = (model.length > index) ? model[index] : null;

    movie?.posterPath != null && movie?.movieId != null
        ? pushWidgetWithFade(context, const MovieDetailsPresenter())
        : buildShowSnackBar(context, 'MovieStrings().detailsNotAvailable');
  }
}
