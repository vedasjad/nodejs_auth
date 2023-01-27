import 'dart:convert';

import 'city.dart';

final List<String> cityList = [];

class CityList {
  late final List<City> listOfCities;

  CityList({
    required this.listOfCities,
  });

  factory CityList.fromJson(Map<String, dynamic> json) {
    final citiesFromJson = json['cityList'] as List;
    return CityList(listOfCities: [
      ...citiesFromJson
          .cast<Map<String, dynamic>>()
          .map((i) => City.fromJson(i)),
    ]);
  }
}
