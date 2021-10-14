/*
 constantes necessárias para acessarmos a API TMDb
*/

import 'package:dio/dio.dart';

const vBaseUrl  = 'https://api.themoviedb.org/3';
const vApiKeyV4 = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NDQ3NDYzMmRmOTExMTk3MmQwNTViMTBhNjQwMWNlNCIsInN1YiI6IjYxNjc2N2Y0NTA3MzNjMDA0MmZkMTNkNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0lYDYG0rYOfCybv8iSLc1-lCXxfwVjPBRDKcQ9gTmIw';
const vApiKey   = '54474632df9111972d055b10a6401ce4';
const vServerError = 'Falha ao conectar ao servidor. Tente novamente mais tarde.';

final vDioOptions = BaseOptions(
  baseUrl: vBaseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
  contentType: 'application/json;charset=utf-8',
  headers: {'Authorization': 'Bearer $vApiKeyV4'},  
);