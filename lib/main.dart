/*
Baseado nas informações do link abaixo
https://medium.com/flutter-comunidade-br/criando-um-aplicativo-em-flutter-para-consumir-uma-api-de-filmes-tmdb-2b5a9982bfcd
*/

import 'package:flutter/material.dart';
import 'core/constants.dart';
import 'core/theme_app.dart';
import 'pages/movie_page.dart';

void main() {
  runApp(const AppFilmes());
}

class AppFilmes extends StatelessWidget {
  const AppFilmes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: vAppName,
      theme: vThemeApp,
      home: const MoviePage(),
    );
  }
}

//todo: documentação
// https://medium.com/flutter-comunidade-br/criando-um-aplicativo-em-flutter-para-consumir-uma-api-de-filmes-tmdb-2b5a9982bfcd