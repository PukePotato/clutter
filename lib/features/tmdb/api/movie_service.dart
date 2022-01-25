import 'package:clutter/core/service_factory.dart';
import 'package:clutter/env/api_keys.dart';
import 'package:clutter/env/endpoints.dart';
import 'package:clutter/features/tmdb/api/base_movies_response.dart';

class MovieService {
  final ServiceFactory _movieService = ServiceFactory(
    baseUrl: Endpoints.tmdbBaseUrl,
    params: {'api_key': tmdbApiKey, 'adult': false},
  );

  // TODO sortBy top_rated, latest, now_playing, popular, upcoming
  Future<BaseMovieResponse> fetchMovies() async {
    final response = await _movieService.get('/movie/popular');
    return BaseMovieResponse.fromJson(response);
  }
}
