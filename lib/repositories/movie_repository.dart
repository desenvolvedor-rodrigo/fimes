/*
  conectar na API do TMDb utilizando dio e converter a resposta em JSON para um objeto model
*/

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../core/api.dart';
import '../errors/movie_error.dart';
import '../models/movie_detail_model.dart';
import '../models/movie_response_model.dart';

class MovieRepository {
  final Dio _dio = Dio(vDioOptions);

  Future<Either<MovieError, MovieResponseModel>> fetchAllMovies(
      int page) async {
    try {
      final response = await _dio.get('/movie/popular?page=$page&language=pt-BR');
      final model = MovieResponseModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            MovieRepositoryError(error.response?.data['status_message']));
      } else {
        return Left(MovieRepositoryError(vServerError));
      }
    } on Exception catch (error) {
      return Left(MovieRepositoryError(error.toString()));
    }
  }

  Future<Either<MovieError, MovieDetailModel>> fetchMovieById(int id) async {
    try {
      final response = await _dio.get('/movie/$id?language=pt-BR');
      final model = MovieDetailModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            MovieRepositoryError(error.response?.data['status_message']));
      } else {
        return Left(MovieRepositoryError(vServerError));
      }
    } on Exception catch (error) {
      return Left(MovieRepositoryError(error.toString()));
    }
  }
}