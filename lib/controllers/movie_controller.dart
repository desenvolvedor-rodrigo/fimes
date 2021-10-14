/*
  responsável pelo controle dos filmes a serem exibidos
*/

import 'package:dartz/dartz.dart';

import 'package:fimes/errors/movie_error.dart';
import 'package:fimes/models/movie_model.dart';
import 'package:fimes/models/movie_response_model.dart';
import 'package:fimes/repositores/movie_repository.dart';

class MovieController {
  final _repository = MovieRepository();

  late MovieResponseModel movieResponseModel;
  late MovieError movieError;
  bool loading = true;

  List<MovieModel> get movies => movieResponseModel?.movies ?? <MovieModel> [];

  int  get moviesCount => movies.length;
  bool get hasMovies   => moviesCount != 0;
  int  get totalPages  => movieResponseModel?.totalPages ?? 1;
  int  get currentPage => movieResponseModel?.page ?? 1;

  Future<Either<MovieError, MovieResponseModel>> fetchAllMovies({int page = 1}) async {
    //movieError = null;
    final result = await _repository.fetchAllMovies(page);
    result.fold(
      (error) => movieError = error,
      (movie) {
        if (movieResponseModel == null) {
          movieResponseModel = movie;
        } else {
          movieResponseModel.page = movie.page;
          movieResponseModel.movies.addAll(movie.movies);
        }
      }
    );

    return result;
  }
}

//todo: MovieDetailController
// https://medium.com/flutter-comunidade-br/criando-um-aplicativo-em-flutter-para-consumir-uma-api-de-filmes-tmdb-2b5a9982bfcd