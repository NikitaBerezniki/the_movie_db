import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/domain/api_client/api_client.dart';
import 'package:the_movie_db/domain/entities/movie.dart';
import 'package:the_movie_db/models/movie_list_model.dart';
import 'package:the_movie_db/service/main_navigation.dart';
// import '../../domain/entities/movie_temporary.dart';
import '../../resources/styles.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  // List<Movie> filteredMovies = [];
  // TextEditingController searchController = TextEditingController();
  // bool isVisibleSearch = false;

  // void searchMovies() {
  //   final query = searchController.text;
  //   if (query.isNotEmpty) {
  //     filteredMovies = movies.where((MovieTemporary movie) {
  //       return movie.title.toLowerCase().contains(query.toLowerCase());
  //     }).toList();
  //   } else {
  //     filteredMovies = movies;
  //   }
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   // searchMovies();
  //   // searchController.addListener(searchMovies);
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieListModel>(context, listen: false).getPopularMovieList();
    });
  }

  void onMovieTap(movies, int index) {
    final id = movies.elementAt(index).id;

    Navigator.of(context)
        .pushNamed(MainNavigationOfRoutes.movieDetailsPage, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieListModel>(
      builder: (context, model, child) {
        return Stack(
          children: [
            ListView.builder(
              // padding: isVisibleSearch ? const EdgeInsets.only(top: 70) : null,
              // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: model.movies.length,
              itemExtent: 163,
              itemBuilder: (BuildContext context, int index) {
                // final movie = filteredMovies.elementAt(index);
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Stack(children: [
                    CardFilmWidget(movie: model.movies.elementAt(index)),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => onMovieTap(model.movies, index),
                      ),
                    ),
                  ]),
                );
              },
            ),
            // SearchWidget(isVisibleSearch: isVisibleSearch, searchController: searchController)
          ],
        );
      },
    );
  }
}

class CardFilmWidget extends StatelessWidget {
  const CardFilmWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorStyle.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 8)
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(children: [
        Image.network(
          ApiClient.makeUrlForImage(movie.posterPath) ?? '',
        ),
        const SizedBox(width: 16),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),
            Text(
              '${movie.title} (${movie.releaseDate?.year})',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              'Дата выхода: ${movie.releaseDate?.day}.${movie.releaseDate?.month}.${movie.releaseDate?.year}',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Text(
              movie.overview,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ]),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.isVisibleSearch,
    required this.searchController,
  }) : super(key: key);

  final bool isVisibleSearch;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Visibility(
        visible: isVisibleSearch,
        child: TextField(
          controller: searchController,
          // onEditingComplete: searchMovies,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
              // if (searchController.text.isNotEmpty){}
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  searchController.clear();
                },
              ),
              prefixIcon: const Icon(Icons.search),
              // labelText: 'Поиск',
              hintText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder()),
        ),
      ),
    );
  }
}
