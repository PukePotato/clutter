import 'package:clutter/features/tmdb/view_model/common/movie_view_model.dart';
import 'package:clutter/ui_kit/grid_image_view.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatelessWidget {
  final List<MovieViewModel> model;
  final void Function()? onTapPosterItem;

  const MoviesScreen({
    Key? key,
    required this.model,
    required this.onTapPosterItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _gridViewBuilder(context, model);
  }

  _gridViewBuilder(BuildContext context, List<MovieViewModel> model) {
    int crossAxisCount;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 3;
    }
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: (itemWidth / itemHeight),
          crossAxisSpacing: 0.0),
      itemCount: model.length,
      itemBuilder: (context, index) => _buildMovieCard(
        context,
        index,
        model,
        model[index].posterPath,
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context, int index,
      List<MovieViewModel?> movies, String imagePath) {
    // bloc.pageIndexControllerSubscription.add(index);
    final MovieViewModel? movie =
        (movies.length > index) ? movies[index] : null;

    return ImageGridView(
      // onTapGridItem: () => _onPosterTap(context, movie),
      onTapGridItem: onTapPosterItem,
      imagePath: imagePath,
    );
  }
}
