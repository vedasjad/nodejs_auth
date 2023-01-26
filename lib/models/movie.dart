import 'dart:convert';

class Movie {
  final String movieId;
  final String movieName;
  final String releaseDate;

  Movie({
    required this.movieId,
    required this.movieName,
    required this.releaseDate,
  });
  Map<String, dynamic> toMap() {
    return {
      'movieName': movieName,
      'movieId': movieId,
      'releaseDate': releaseDate,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      movieName: map['movieName'] ?? '',
      movieId: map['movieId'] ?? '',
      releaseDate: map['releaseDate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromJson(json.decode(source));
}
