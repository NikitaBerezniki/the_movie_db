import 'package:flutter/material.dart';
import 'package:the_movie_database/movie_list_page.dart';
import 'package:the_movie_database/widgets/app_bar_widget.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;
  const MovieDetailsPage({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final movie = movies.where((element) => element.id == widget.movieId).first;

    return Scaffold(
      appBar: simpleAppBar(),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Image.asset(
                  movie.imageBackground,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 350,
                constraints: BoxConstraints(),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(movie.imagePoster),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
