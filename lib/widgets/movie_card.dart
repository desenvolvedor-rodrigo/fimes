import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;
  final Function onTap;
  final double voteAverage;

  const MovieCard({
    Key? key,
    this.posterPath = '',
    required this.onTap,
    required this.voteAverage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(
              'https://image.tmdb.org/t/p/w220_and_h330_face$posterPath',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [const Icon(Icons.star), Text(voteAverage.toString())],
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
