import 'package:clutter/features/tmdb/api/base_movies_response.dart';
import 'package:clutter/features/tmdb/api/movie_service.dart';
import 'package:clutter/features/tmdb/common/movie_response.dart';
import 'package:clutter/features/tmdb/repository/movie_repository.dart';
import 'package:clutter/features/tmdb/repository/movie_repository_impl.dart';
import 'package:clutter/features/tmdb/view_model/common/movie_view_model.dart';
import 'package:clutter/features/tmdb/view_model/movies/movies_view_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesCubit extends Cubit<MoviesState> {
  late MovieRepository _repo;

  MoviesCubit({MovieRepository? repository}) : super(const MoviesState()) {
    _repo = repository ??
        MovieRepositoryImpl(
          movieService: MovieService(),
        );
  }

  Future<void> fetchMovies() async {
    emit(const MovieStateLoading());
    final response = await _repo.fetchMovies();
    emit(MovieStateLoaded(viewModel: _createViewModel(response)));
  }

  MoviesViewModel _createViewModel(BaseMovieResponse? response) {
    return MoviesViewModel(
      page: response?.page,
      totalResults: response?.totalResults,
      totalPages: response?.totalPages,
      movies: _movieViewModel(response?.movies),
    );
  }

  List<MovieViewModel>? _movieViewModel(List<MovieResponse?>? response) {
    if (response != null) {
      return response
          .map(
            (movie) => MovieViewModel(
              posterPath: movie?.posterPath ?? '',
              movieId: movie?.movieId,
              backdropPath: movie?.backdropPath,
              title: movie?.title ?? movie?.originalTitle,
              overview: movie?.overview,
              releaseDate: movie?.releaseDate,
            ),
          )
          .toList();
    }
  }
}

class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object?> get props => [];
}

class MovieStateLoading extends MoviesState {
  const MovieStateLoading();
}

class MovieStateLoaded extends MoviesState {
  const MovieStateLoaded({required this.viewModel});

  final MoviesViewModel viewModel;

  @override
  List<Object> get props => [viewModel];
}
