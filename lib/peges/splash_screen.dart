import 'dart:async';
import 'package:chat_app/peges/home_page.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../helper/helper_function.dart';
import 'get_started_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    navigateHome();
    getUserLoggedInStatus();
  }

  navigateHome() async {
    await Future.delayed(
      Duration(seconds: 1),
      () => nextScreenReplace(
        context,
        _isSignedIn ? const HomePage() : const GetStarted(),
      ),
    );
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff703efe),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/Logo.png"),
            const Text(
              "Groopie",
              style: TextStyle(
                color: Color.fromARGB(110, 0, 0, 0),
                fontSize: 27,
                fontWeight: FontWeight.bold,
                fontFamily: "Gruppo",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
