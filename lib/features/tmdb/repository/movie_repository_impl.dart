import 'package:clutter/features/tmdb/api/base_movies_response.dart';
import 'package:clutter/features/tmdb/api/movie_service.dart';
import 'package:clutter/features/tmdb/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  late MovieService movieService;

  MovieRepositoryImpl({required this.movieService});

  @override
  Future<BaseMovieResponse> fetchMovies() => movieService.fetchMovies();
}
