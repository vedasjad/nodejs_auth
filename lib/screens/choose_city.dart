import 'package:flutter/material.dart';

import '../models/city_list.dart';
import '../services/user_services.dart';

class ChooseCity extends StatefulWidget {
  const ChooseCity({Key? key}) : super(key: key);

  @override
  State<ChooseCity> createState() => _ChooseCityState();
}

class _ChooseCityState extends State<ChooseCity> {
  final UserService userService = UserService();

  void getMovies() {
    userService.getCities(context: context);
  }

  // setState(() {
  // });
  @override
  Widget build(BuildContext context) {
    getMovies;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              cityList.isEmpty
                  ? ElevatedButton(
                      onPressed: () {
                        getMovies();
                      },
                      child: const Text("Get Cities"),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: cityList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(
                              cityList[index],
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 15),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
