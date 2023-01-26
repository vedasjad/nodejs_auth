import 'dart:convert';

class TheatreShows {
  final String movieId;
  final List shows;

  TheatreShows({
    required this.movieId,
    required this.shows,
  });
  Map<String, dynamic> toMap() {
    return {
      'movieId': movieId,
      'shows': shows,
    };
  }

  factory TheatreShows.fromMap(Map<String, dynamic> map) {
    return TheatreShows(
      movieId: map['movieId'] ?? '',
      shows: map['shows'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory TheatreShows.fromJson(String source) => TheatreShows.fromJson(json.decode(source));
}
