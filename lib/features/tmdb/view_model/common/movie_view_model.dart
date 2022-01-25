class MovieViewModel {
  int? movieId;
  int? voteCount;
  double? voteAverage;
  String? title;
  DateTime? releaseDate;
  String? originalLanguage;
  String? backdropPath;
  String? overview;
  String posterPath;
  double? popularity;

  MovieViewModel({
    this.movieId,
    this.voteCount,
    this.voteAverage,
    this.title,
    this.releaseDate,
    this.originalLanguage,
    this.backdropPath,
    this.overview,
    this.posterPath = '',
    this.popularity,
  });
}
