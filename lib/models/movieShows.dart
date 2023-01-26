import 'dart:convert';

class MovieShows {
  final String theatreId;
  final List shows;

  MovieShows({
    required this.theatreId,
    required this.shows,
  });
  Map<String, dynamic> toMap() {
    return {
      'theatreId': theatreId,
      'shows': shows,
    };
  }

  factory MovieShows.fromMap(Map<String, dynamic> map) {
    return MovieShows(
      theatreId: map['theatreId'] ?? '',
      shows: map['shows'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieShows.fromJson(String source) => 
  MovieShows.fromJson(json.decode(source));
}
