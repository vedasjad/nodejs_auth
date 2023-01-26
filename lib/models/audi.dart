import 'dart:convert';

class Audi {
  final String audiId;
  final String numberOfRows;
  final String numberOfColumns;
  final String typesOfSeats;
  final List seats;

  Audi({
    required this.audiId,
    required this.numberOfRows,
    required this.numberOfColumns,
    required this.typesOfSeats,
    required this.seats,
  });
  Map<String, dynamic> toMap() {
    return {
      'audiId': audiId,
      'numberOfRows': numberOfRows,
      'numberOfColumns': numberOfColumns,
      'typesOfSeats': typesOfSeats,
      'seats': seats,
    };
  }

  factory Audi.fromMap(Map<String, dynamic> map) {
    return Audi(
      audiId: map['audiId'] ?? '',
      numberOfColumns: map['numberOfColumns'] ?? '',
      numberOfRows: map['numberOfRows'] ?? '',
      typesOfSeats: map['typesOfSeats'] ?? '',
      seats: map['seats'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Audi.fromJson(String source) => Audi.fromJson(json.decode(source));
}
