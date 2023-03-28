import 'dart:async';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'get_started_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 1),
      () => nextScreenReplace(
        context,
        const GetStarted(),
      ),
    );
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
