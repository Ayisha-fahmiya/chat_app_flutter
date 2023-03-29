import 'package:chat_app/peges/home_page.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'auth/login_page.dart';

class ProfilePage extends StatefulWidget {
  String userName;
  String email;
  ProfilePage({
    super.key,
    required this.userName,
    required this.email,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: const EdgeInsets.symmetric(vertical: 50),
      //     children: [
      //       Icon(
      //         Icons.account_circle,
      //         size: 150,
      //         color: Colors.grey[700],
      //       ),
      //       const SizedBox(height: 15),
      //       Text(
      //         widget.userName,
      //         style: const TextStyle(
      //             color: Colors.black, fontWeight: FontWeight.bold),
      //         textAlign: TextAlign.center,
      //       ),
      //       const SizedBox(height: 30),
      //       const Divider(),
      //       ListTile(
      //         onTap: () {
      //           nextScreen(context, const HomePage());
      //         },
      //         selectedColor: Theme.of(context).primaryColor,
      //         contentPadding:
      //             const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //         leading: const Icon(Icons.group),
      //         title: const Text(
      //           "Groups",
      //           style: TextStyle(color: Colors.black),
      //         ),
      //       ),
      //       ListTile(
      //         onTap: () {},
      //         selectedColor: Theme.of(context).primaryColor,
      //         selected: true,
      //         contentPadding:
      //             const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //         leading: const Icon(Icons.group),
      //         title: const Text(
      //           "Profile",
      //           style: TextStyle(color: Colors.black),
      //         ),
      //       ),
      //       ListTile(
      //         onTap: () async {
      //           showDialog(
      //             barrierDismissible: false,
      //             context: context,
      //             builder: (context) {
      //               return AlertDialog(
      //                 title: const Text("Logout"),
      //                 content: const Text("Are you sure you want to logout?"),
      //                 actions: [
      //                   IconButton(
      //                     onPressed: () {
      //                       Navigator.pop(context);
      //                     },
      //                     icon: const Icon(
      //                       Icons.cancel,
      //                       color: Colors.red,
      //                     ),
      //                   ),
      //                   IconButton(
      //                     onPressed: () async {
      //                       await authService.signOut();
      //                       // ignore: use_build_context_synchronously
      //                       Navigator.of(context).pushAndRemoveUntil(
      //                           MaterialPageRoute(
      //                             builder: (context) => const LoginPage(),
      //                           ),
      //                           (route) => false);
      //                     },
      //                     icon: const Icon(
      //                       Icons.done,
      //                       color: Colors.green,
      //                     ),
      //                   ),
      //                 ],
      //               );
      //             },
      //           );
      //         },
      //         selectedColor: Theme.of(context).primaryColor,
      //         contentPadding:
      //             const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //         leading: const Icon(Icons.exit_to_app),
      //         title: const Text(
      //           "Logout",
      //           style: TextStyle(color: Colors.black),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 170, horizontal: 40),
        child: Column(
          children: [
            Icon(
              Icons.account_circle,
              size: 200,
              color: Colors.grey[700],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Full Name", style: TextStyle(fontSize: 17)),
                Text(widget.userName, style: const TextStyle(fontSize: 17)),
              ],
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Email", style: TextStyle(fontSize: 17)),
                Text(widget.email, style: const TextStyle(fontSize: 17)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
