import 'package:flutter/material.dart';
import 'package:node_auth/providers/user_provider.dart';
import 'package:node_auth/screens/choose_city.dart';
import 'package:node_auth/screens/home_screen.dart';
import 'package:node_auth/screens/login_screen.dart';
import 'package:node_auth/screens/signup_screen.dart';
import 'package:node_auth/services/auth_services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    // debugPrint("checkpoint 0");
    // authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Node Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider.of<UserProvider>(context).user.token.isEmpty
          ? const ChooseCity()
          : const ChooseCity(),
    );
  }
}
