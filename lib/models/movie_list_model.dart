import 'package:flutter/material.dart';
import 'package:the_movie_db/domain/api_client/api_client.dart';

import '../domain/entities/movie.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final List<Movie> _movies = [];
  List<Movie> get movies => List.unmodifiable(_movies);

  Future<void> getPopularMovieList() async {
    final moviesResponse = await _apiClient.fetchPopularMovie(1, 'ru-Ru');
    _movies.addAll(moviesResponse.movies);
    notifyListeners();
  }
}
