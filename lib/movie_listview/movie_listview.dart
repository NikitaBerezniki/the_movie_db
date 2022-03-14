import 'package:flutter/material.dart';
import '../resources/styles.dart';
import 'movie_dataclass.dart';



class MovieListViewWidget extends StatefulWidget {
  const MovieListViewWidget({Key? key}) : super(key: key);

  @override
  State<MovieListViewWidget> createState() => _MovieListViewWidgetState();
}

class _MovieListViewWidgetState extends State<MovieListViewWidget> {
  List<Movie> filteredMovies = <Movie>[];

  TextEditingController searchController = TextEditingController();

  bool isVisibleSearch = false;

  void onMovieTap(int index) {
    final id = movies.elementAt(index).id;
    Navigator.of(context).pushNamed('/movie_details_page', arguments: id);
  }

  void searchMovies() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filteredMovies = movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteredMovies = movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    searchMovies();
    searchController.addListener(searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          // padding: isVisibleSearch ? const EdgeInsets.only(top: 70) : null,
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = filteredMovies.elementAt(index);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Stack(children: [
                CardFilmWidget(movie: movie),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => onMovieTap(index),
                  ),
                ),
              ]),
            );
          },
        ),
        // SearchWidget(isVisibleSearch: isVisibleSearch, searchController: searchController)
      ],
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
        Image.asset(movie.imagePoster),
        const SizedBox(width: 16),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),
            Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "${movie.time?.day} ${movie.time?.month} ${movie.time?.year}",
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Text(
              movie.description,
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
