import 'dart:convert';

import 'city.dart';

final List<String> cityList = [];

class CityList {
  late final List<City> listOfCities;

  CityList({
    required this.listOfCities,
  });

  // factory CityList.fromJson(List<City>json){
  //   final citiesFromJson = json[''] as List;
  //   return CityList(
  //     listOfCities: [
  //       ...citiesFromJson.cast()
  //     ]
  //   );
  // }
}
