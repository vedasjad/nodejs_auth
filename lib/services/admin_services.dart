import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:node_auth/models/theatre.dart';
import 'package:node_auth/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:node_auth/models/movie.dart';
import '../utils/constants.dart';

class AdminService {
  void postTheatre({
    required BuildContext context,
    required String city,
    required String theatreName,
  }) async {
    try {
      Theatre theatre = Theatre(
        theatreId: city + theatreName,
        theatreName: theatreName,
        city: city,
      );

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/postTheatre'),
        body: theatre.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode != 201) {
        debugPrint(res.statusCode.toString());
      }
      showSnackBar(
        context,
        'Theatre has been added successfully!',
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
