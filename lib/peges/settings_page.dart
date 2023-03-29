import 'package:flutter/material.dart';

import '../service/auth_service.dart';
import '../widgets/logout_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
    required this.context,
    required this.authService,
  }) : super(key: key);

  final BuildContext context;
  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        toolbarHeight: 90,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Logout(
          context: context,
          authService: authService,
        ),
      ),
    );
  }
}
