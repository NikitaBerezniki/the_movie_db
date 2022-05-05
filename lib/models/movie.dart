import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';
// GET /movie/{movie_id}
// https://developers.themoviedb.org/3/movies

@JsonSerializable()
class Movie {
  final bool? adult;
  @JsonValue('backdrop_path')
  final String? backdropPath;
    @JsonValue('belongs_to_collection')
  final dynamic belongsToCollection;
  final int budget;
  final List<Genre> genres;

  Movie(this.adult, this.backdropPath, this.belongsToCollection, this.budget, this.genres);



}
