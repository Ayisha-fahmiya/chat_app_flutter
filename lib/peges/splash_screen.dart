import 'dart:async';
import 'package:chat_app/peges/home_page.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
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
      const Duration(seconds: 2),
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
    return const Scaffold(
      body: Center(
        child: SizedBox(
          height: 150,
          child: RiveAnimation.asset("assets/GChatLogoAnimated.riv"),
        ),
      ),
    );
  }
}
