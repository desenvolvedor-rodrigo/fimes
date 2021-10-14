/*
  conectar na API do TMDb utilizando dio e converter a resposta em JSON para um objeto model
*/

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fimes/core/api.dart';

import 'package:fimes/errors/movie_error.dart';
import 'package:fimes/models/movie_detail_model.dart';
import 'package:fimes/models/movie_response_model.dart';

class MovieRepository {

  final Dio _dio = Dio(vDioOptions);

  Future<Either<MovieError, MovieResponseModel>> fetchAllMovies(int page) async {
    try {
      final response = await _dio.get('/movie/popular?page=$page');
      final model = MovieResponseModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(MovieRepositoryError(error.response!.data['status_message']));
      } else {
        return Left(MovieRepositoryError(error.toString()));
      }
    }
  }

  Future<Either<MovieError, MovieDetailModel>> fetchMovieById (int id) async {
    try {
      final response = await _dio.get('/movies/$id');
      final model = MovieDetailModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(MovieRepositoryError(error.response!.data['status_message']));
      } else {
        return Left(MovieRepositoryError(vServerError));
      }
    } on Exception catch (error) {
      return Left(MovieRepositoryError(error.toString()));
    }
  }

}