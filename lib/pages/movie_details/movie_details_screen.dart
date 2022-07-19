import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/models/movie_list_model.dart';
// import '../../domain/entities/movie_temporary.dart';
import '../../widgets/simple_app_bar_widget.dart';
import 'movie_details_cast_widget.dart';
import 'movie_details_intro.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;
  final ScrollController listViewController = ScrollController();
  MovieDetailsScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    super.initState();
    widget.listViewController.addListener(() {});
    Provider.of<MovieListModel>(context, listen: false).getPopularMovieList();
  }

  bool isBottomList() {
    return widget.listViewController.position.pixels.toInt() ==
            widget.listViewController.position.maxScrollExtent.toInt()
        ? true
        : false;
  }

  void moveDown() {
    widget.listViewController.animateTo(
      widget.listViewController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // floatingActionButton: isBottomList() == true ?  FloatingActionButton(onPressed: moveDown, child: Icon(Icons.arrow_downward)): null,
      appBar: simpleAppBar(),
      body: Consumer<MovieListModel>(builder: (_, moviesModel, __) {
        final movies = moviesModel.movies;
        return ListView(
          controller: widget.listViewController,
          children: [
            ColoredBox(
              color: Color.fromRGBO(30, 16, 19, 1.0),
              child: MovieDetailsIntro(
                  movie: movies.elementAt(widget.movieId),
                  ),
            ),
            ColoredBox(
              color: Colors.white,
              child: MovieDetailsCastWidget(),
            ),
          ],
        );
      }),
    );
  }
}
