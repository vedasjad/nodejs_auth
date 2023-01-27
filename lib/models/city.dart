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

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      city: json['city'] as String ?? '',
    );
  }

  @override
  String toString() => city;

  // factory City.fromJson(Map<String,dynamic> source) => City.fromJson(json.decode(source));
}
