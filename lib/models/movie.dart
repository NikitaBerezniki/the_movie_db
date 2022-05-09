// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';
// movie/{movie_id}
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
  Movie({
    this.adult,
    this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
  });
 

  Movie copyWith({
    bool? adult,
    String? backdropPath,
    dynamic belongsToCollection,
    int? budget,
    List<Genre>? genres,
  }) {
    return Movie(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      belongsToCollection: belongsToCollection ?? this.belongsToCollection,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdropPath,
      'belongs_to_collection': belongsToCollection,
      'budget': budget,
      'genres': genres.map((x) => x.toMap()).toList(),
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      adult: map['adult'] != null ? map['adult'] as bool : null,
      backdropPath: map['backdrop_path'] != null ? map['backdrop_path'] as String : null,
      belongsToCollection: map['belongs_to_collection'] as dynamic,
      budget: map['budget'] as int,
      genres: List<Genre>.from((map['genres'] as List<int>).map<Genre>((x) => Genre.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(adult: $adult, backdrop_path: $backdropPath, belongs_to_collection: $belongsToCollection, budget: $budget, genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Movie &&
      other.adult == adult &&
      other.backdropPath == backdropPath &&
      other.belongsToCollection == belongsToCollection &&
      other.budget == budget &&
      listEquals(other.genres, genres);
  }

  @override
  int get hashCode {
    return adult.hashCode ^
      backdropPath.hashCode ^
      belongsToCollection.hashCode ^
      budget.hashCode ^
      genres.hashCode;
  }
}
