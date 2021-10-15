import 'package:dartz/dartz.dart';

import '../errors/movie_error.dart';
import '../models/movie_detail_model.dart';
import '../repositories/movie_repository.dart';

class MovieDetailController {
  final _repository = MovieRepository();

  MovieDetailModel movieDetail = MovieDetailModel(adult: false, backdropPath: '', belongsToCollection: '', budget: 0, genres: [], homepage: '', id: 0, imdbId: '', originalLanguage: '', originalTitle: '', overview: '', popularity: 0, posterPath: '', productionCompanies: [], productionCountries: [], releaseDate: DateTime.now(), revenue: 0, runtime: 0, spokenLanguages: [], status: '', tagline: '', title: '', video: false, voteAverage: 0, voteCount: 0);
  //MovieError movieError;

  bool loading = true;

  Future<Either<MovieError, MovieDetailModel>> fetchMovieById(int id) async {
    //movieError = null;
    final result = await _repository.fetchMovieById(id);
    result.fold(
      (error) => print('erro fetchMovieById: $error'),//movieError = error,
      (detail) => movieDetail = detail,
    );
    return result;
  }
}