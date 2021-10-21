/*
  informações da página, quantidade de filmes, quantidade de páginas e a lista de MovieModel
*/
import 'dart:convert';

import 'movie_model.dart';

class MovieResponseModel {
  int page;
  final int totalResults;
  final int totalPages;
  final List<MovieModel> movies;

  MovieResponseModel({
    required this.page,
    required this.totalResults,
    required this.totalPages,
    required this.movies,
  });

  factory MovieResponseModel.fromJson(String str) =>
      MovieResponseModel.fromMap(json.decode(str));

  factory MovieResponseModel.fromMap(Map<String, dynamic> json) =>
      MovieResponseModel(
        page: json["page"] ?? 0,
        totalResults: json["total_results"] ?? 0,
        totalPages: json["total_pages"] ?? 0,
        movies: List<MovieModel>.from(
            json["results"].map((x) => MovieModel.fromMap(x))),
      );
}
