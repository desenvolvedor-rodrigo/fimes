import 'package:flutter/material.dart';

import '../controllers/movie_detail_controller.dart';
import '../widgets/centered_message.dart';
import '../widgets/centered_progress.dart';
import '../widgets/chip_date.dart';
import '../widgets/rate.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;

  const MovieDetailPage(this.movieId, {Key? key}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final _controller = MovieDetailController();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchMovieById(widget.movieId);

    setState(() {
      _controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: _buildAppBar(),
      body: _buildMovieDetail(),
    );
  }
/*
  _buildAppBar() {
    return AppBar(
      title: Text(_controller.movieDetail.title),
    );
  }
*/
  _buildMovieDetail() {
    if (_controller.loading) {
      return const CenteredProgress();
    }

    if (_controller.movieError.message.isNotEmpty) {
      return CenteredMessage(message: _controller.movieError.message);
    }

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200.0,
          pinned: true,
          snap: false,
          floating: false,
          flexibleSpace: _buildFlexibleSpaceBar(),
          automaticallyImplyLeading: true,          
          //actions: <Widget>[
          //  _buildCover(),
          //],
        ),
        SliverToBoxAdapter(
          child: Column(
              children: [
                Text(_controller.movieDetail.originalTitle),
                Text(_controller.movieDetail.tagline),
              ],
            ),
          
        ),
        SliverToBoxAdapter(child: _buildStatus(),),
        SliverToBoxAdapter(child: _buildOverview(),),
        SliverToBoxAdapter(child: _buildInfo(),),
        SliverToBoxAdapter(child: _buildInfo(),),
        SliverToBoxAdapter(child: _buildInfo(),),
      ],
    );
/*
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        _buildCover(),
        _buildStatus(),
        _buildOverview(),
        _buildInfo(),
        _buildInfo(),
      ],
    );
*/    
  }

  _buildFlexibleSpaceBar(){
     return FlexibleSpaceBar(
            title: Text(_controller.movieDetail.title),
            background: _buildCover(),
          );
  }
  _buildCover() {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),),
      child: Image.network(
        'https://image.tmdb.org/t/p/w500${_controller.movieDetail.backdropPath}',
      ),
    );
  }

  _buildStatus() {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Rate(_controller.movieDetail.voteAverage),
          ChipDate(date: _controller.movieDetail.releaseDate),
        ],
      ),
    );
  }

  _buildOverview() {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Text(
        _controller.movieDetail.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }

  _buildInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Text(
            'Informações',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            _controller.movieDetail.homepage,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            _controller.movieDetail.status,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
