import 'dart:convert';

class City {
  final String cityName;
  final List theatres;

  City({
    required this.cityName,
    required this.theatres,
  });
  Map<String, dynamic> toMap() {
    return {
      'cityName': cityName,
      'theatres': theatres,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      cityName: map['cityName'] ?? '',
      theatres: map['theatres'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) => City.fromJson(json.decode(source));
}
