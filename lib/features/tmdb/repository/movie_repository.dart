import 'package:clutter/features/tmdb/api/base_movies_response.dart';

abstract class MovieRepository {
  Future<BaseMovieResponse> fetchMovies();
}
