import 'package:flutter/material.dart';
import '../models/city.dart';

class CityProvider extends ChangeNotifier {
  City _city = City(
    city: '',
  );

  City get city => _city;

  void setCity(String city) {
    _city = City.fromJson(city);
    notifyListeners();
  }

  void setCityFromModel(City city) {
    _city = city;
    notifyListeners();
  }
}
