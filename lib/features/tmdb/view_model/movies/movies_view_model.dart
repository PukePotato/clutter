import 'package:clutter/features/tmdb/view_model/common/movie_view_model.dart';

class MoviesViewModel {
  int? page;
  int? totalResults;
  int? totalPages;
  List<MovieViewModel>? movies;

  MoviesViewModel({
    this.page,
    this.totalResults,
    this.totalPages,
    this.movies,
  });
}
