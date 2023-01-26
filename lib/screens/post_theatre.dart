import 'package:flutter/material.dart';
import 'package:node_auth/services/admin_services.dart';

import '../custom_textfield.dart';

class PostMovies extends StatefulWidget {
  const PostMovies({Key? key}) : super(key: key);

  @override
  State<PostMovies> createState() => _PostMoviesState();
}

class _PostMoviesState extends State<PostMovies> {
  final TextEditingController theatreNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final AdminService adminService = AdminService();

  void postTheatre() {
    adminService.postTheatre(
      context: context,
      theatreName: theatreNameController.text,
      city: cityController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Add Theatre",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: theatreNameController,
              hintText: 'Enter Theatre Name',
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: cityController,
              hintText: 'Enter City',
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: postTheatre,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              textStyle: MaterialStateProperty.all(
                const TextStyle(color: Colors.white),
              ),
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width / 2.5, 50),
              ),
            ),
            child: const Text(
              "Add Theatre",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
