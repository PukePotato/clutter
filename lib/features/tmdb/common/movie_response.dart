import 'package:clutter/features/tmdb/common/original_language_enum.dart';

class MovieResponse {
  MovieResponse({
    this.adult = false,
    this.backdropPath,
    this.movieId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity = 0.0,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video = false,
    this.voteAverage,
    this.voteCount,
  });

  final bool adult;
  final String? backdropPath;
  final int? movieId;
  final OriginalLanguage? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String? title;
  final bool video;
  final double? voteAverage;
  final int? voteCount;

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        movieId: json["id"],
        originalLanguage:
            json["original_language"] == null ? null : originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );
}
