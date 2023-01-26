import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:node_auth/models/user.dart';
import 'package:node_auth/providers/user_provider.dart';
import 'package:node_auth/screens/home_screen.dart';
import 'package:node_auth/screens/signup_screen.dart';
import 'package:node_auth/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/city.dart';
import '../models/city_list.dart';
import '../providers/city_provider.dart';
import '../utils/constants.dart';

class UserService {
  void getCities({
    required BuildContext context,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('https://movie-mozzo-ps9w.onrender.com/api/getCities'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      debugPrint(res.body);
      if (res.statusCode != 201) {
        debugPrint(res.statusCode.toString());
      }

      final citiesClassList = json.decode(res.body) as Map<String, dynamic>;

      // citiesClassList = res.body as List<City>;

      // for (City city in citiesClassList) {
      //   debugPrint(city.city);
      //   cityList.add(city.city);
      // }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
