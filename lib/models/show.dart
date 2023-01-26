import 'dart:convert';

class Show {
  final String showId;
  final String theatreId;
  final String movieId;
  final String date;
  final String time;
  final String audi;
  // final String typesOfPrices;
  final List prices;

  Show({
    required this.showId,
    required this.theatreId,
    required this.movieId,
    required this.date,
    required this.time,
    required this.audi,
    required this.prices,
    // required this.typesOfPrices,
  });
  Map<String, dynamic> toMap() {
    return {
      'showId': showId,
      'theatreId': theatreId,
      'movieId': movieId,
      'date': date,
      'time': time,
      'audi': audi,
      // 'typesOfPrices':typesOfPrices,
      'prices':prices,
    };
  }

  factory Show.fromMap(Map<String, dynamic> map) {
    return Show(
      showId: map['showId'] ?? '',
      theatreId: map['theatreId'] ?? '',
      movieId: map['movieId'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      audi: map['audi'] ?? '',
      // typesOfPrices: map['typesOfPrices'] ?? '',
      prices: map['prices'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Show.fromJson(String source) => Show.fromJson(json.decode(source));
}
