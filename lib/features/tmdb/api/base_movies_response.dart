import 'package:clutter/features/tmdb/common/movie_response.dart';

typedef Json = Map<String, dynamic>;

class BaseMovieResponse {
  BaseMovieResponse({
    this.page,
    this.movies = const [],
    this.totalPages,
    this.totalResults,
  });

  final int? page;
  final List<MovieResponse> movies;
  final int? totalPages;
  final int? totalResults;

  factory BaseMovieResponse.fromJson(Json json) => BaseMovieResponse(
        page: json["page"],
        movies: _movies(json["results"]),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  static List<MovieResponse> _movies(List<dynamic> json) => json.isNotEmpty
      ? json.map((movie) => MovieResponse.fromJson(movie)).toList()
      : [];
}
