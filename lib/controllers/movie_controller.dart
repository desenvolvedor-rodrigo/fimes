/*
  responsável pelo controle dos filmes a serem exibidos
*/

import 'package:dartz/dartz.dart';
import '../errors/movie_error.dart';
import '../models/movie_model.dart';
import '../models/movie_response_model.dart';
import '../repositories/movie_repository.dart';

class MovieController {
  final _repository = MovieRepository();

  final MovieResponseModel movieResponseModel =
      MovieResponseModel(page: 0, totalResults: 0, totalPages: 0, movies: []);
  MovieError movieError = MovieRepositoryError('');
  bool loading = true;

  List<MovieModel> get movies => movieResponseModel.movies;
  int get moviesCount => movies.length;
  bool get hasMovies => moviesCount != 0;
  int get totalPages => movieResponseModel.totalPages;
  int get currentPage => movieResponseModel.page;

  Future<Either<MovieError, MovieResponseModel>> fetchAllMovies(
      {int page = 1}) async {
    //movieError.message = '';
    final result = await _repository.fetchAllMovies(page);
    result.fold(
      (error) => movieError = error,
           //debugPrint('error.message: ${error.message}'), //movieError = error,
      (movie) {
        movieResponseModel.page = movie.page;
        movieResponseModel.movies.addAll(movie.movies);
      },
    );

    return result;
  }
}
