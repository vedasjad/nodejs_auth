import 'dart:convert';

class City {
  final String city;

  City({
    required this.city,
  });
  Map<String, dynamic> toMap() {
    return {
      'city': city,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      city: map['city'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) => City.fromJson(json.decode(source));
}
