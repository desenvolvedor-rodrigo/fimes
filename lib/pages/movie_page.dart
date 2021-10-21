import 'package:flutter/material.dart';
import '../core/constants.dart';
import 'movie_detail_page.dart';
import '../widgets/centered_message.dart';
import '../widgets/centered_progress.dart';
import '../widgets/movie_card.dart';
import '../controllers/movie_controller.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final _controller = MovieController();
  final _scrollController = ScrollController();
  int lastPage = 1;

  @override
  void initState() {
    super.initState();
    _initScrollListener();
    _initialize();
  }

  _initScrollListener() {
    _scrollController.addListener(() async {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        if (_controller.currentPage == lastPage) {
          lastPage++;
          await _controller.fetchAllMovies(page: lastPage);
          setState(() {});
        }
      }
    });
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchAllMovies(page: lastPage);

    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      key: UniqueKey(),
      child: Scaffold(
        key: UniqueKey(),
        appBar: _buildAppBar(),
        body: _buildMovieGrid(),
        //resizeToAvoidBottomInset: true,
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(vAppName),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: _initialize,
        ),
      ],
    );
  }

  _buildMovieGrid() {
    if (_controller.loading) {
      return const CenteredProgress();
    }

    if (_controller.movieError.message.isNotEmpty) {
      return CenteredMessage(message: _controller.movieError.message);
    }

    debugPrint('_controller.moviesCount: ${_controller.moviesCount}');
    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(2.0),
      itemCount: _controller.moviesCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.65,
      ),
      itemBuilder: _buildMovieCard,
    );
  }

  Widget _buildMovieCard(context, index) {
    final movie = _controller.movies[index];
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: MovieCard(
        posterPath: movie.posterPath,
        voteAverage: movie.voteAverage,
        onTap: () => _openDetailPage(movie.id)
      ),
    );
  }

  _openDetailPage(movieId) {
    debugPrint('movieID: $movieId');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(movieId),
      ),
    );
  }
}
