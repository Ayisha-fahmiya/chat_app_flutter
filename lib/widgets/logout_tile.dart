import 'package:flutter/material.dart';
import '../peges/auth/login_page.dart';
import '../service/auth_service.dart';

class Logout extends StatelessWidget {
  const Logout({
    Key? key,
    required this.context,
    required this.authService,
  }) : super(key: key);

  final BuildContext context;
  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // tileColor: const Color.fromARGB(255, 224, 224, 224),
      onTap: () async {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Logout"),
              content: const Text("Are you sure you want to logout?"),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await authService.signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false);
                  },
                  icon: const Icon(
                    Icons.done,
                    color: Colors.green,
                  ),
                ),
              ],
            );
          },
        );
      },
      selectedColor: Theme.of(context).primaryColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: const Text(
        "Logout",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
