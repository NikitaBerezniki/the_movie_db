import 'package:flutter/material.dart';
import 'package:the_movie_db/movie_list/movie_list_page.dart';
import '../widgets/app_bar_widget.dart';
import 'movie_details_info_widet.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  MovieDetailsWidget({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    final movie = movies.where((movie) => movie.id == widget.movieId).first;
    return Scaffold(
      appBar: simpleAppBar(),
      body: ListView(
        children: [
          MovieDetailsInfoWidet(movie: movie),
        ],
      ),
    );
  }
}
