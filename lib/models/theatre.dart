import 'dart:convert';

class Theatre {
  final String theatreId;
  final String theatreName;
  final String city;

  Theatre({
    required this.theatreId,
    required this.theatreName,
    required this.city,
  });
  Map<String, dynamic> toMap() {
    return {
      'theatreId':theatreId,
      'theatreName': theatreName,
      'city': city,
    };
  }

  factory Theatre.fromMap(Map<String, dynamic> map) {
    return Theatre(
      theatreId: map['theatreId']??'',
      theatreName: map['theatreName'] ?? '',
      city: map['city'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Theatre.fromJson(String source) => Theatre.fromJson(json.decode(source));
}
