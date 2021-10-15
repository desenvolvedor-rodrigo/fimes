import 'package:fimes/pages/movie_detail_page.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;
  final Function onTap;
  final int id;

  const MovieCard({
    Key? key,
    this.posterPath = '',
    required this.onTap,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
  _openDetailPageTESTE(movieId) {
    print('movieID: $movieId');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(movieId),
      ),
    );
  }

    return //GestureDetector(
      InkWell(
      onTap: () => _openDetailPageTESTE(id),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://image.tmdb.org/t/p/w220_and_h330_face$posterPath',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}