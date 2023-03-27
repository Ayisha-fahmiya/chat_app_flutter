import 'package:flutter/material.dart';
import '../helper/helper_function.dart';
import '../shared/constants.dart';
import 'auth/login_page.dart';
import 'home_page.dart';

class LoginOrHome extends StatefulWidget {
  const LoginOrHome({super.key});

  @override
  State<LoginOrHome> createState() => _LoginOrHomeState();
}

class _LoginOrHomeState extends State<LoginOrHome> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus() async {
      await HelperFunctions.getUserLoggedInStatus().then((value) {
        if (value != null) {
          setState(() {
            _isSignedIn = value;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Constants().primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? const HomePage() : const LoginPage(),
    );
  }
}
