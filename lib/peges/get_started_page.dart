import 'package:chat_app/peges/auth/login_page.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: Stack(
              children: [
                SizedBox(
                  height: 500,
                  child: Image.asset(
                    "assets/GetStartedBGPic.png",
                    fit: BoxFit.cover,
                    opacity: const AlwaysStoppedAnimation(0.2),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 60, horizontal: 32),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 30,
                    ),
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff0a0057),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(90),
                            topRight: Radius.circular(90),
                            bottomRight: Radius.circular(90),
                          ),
                        ),
                        child: Image.asset(
                          "assets/womanOne-removebg-preview.png",
                          fit: BoxFit.cover,
                          alignment: Alignment.topRight,
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 136, 94, 253),
                        backgroundImage:
                            AssetImage("assets/womanTwo-removebg-preview.png"),
                      ),
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 136, 94, 253),
                        backgroundImage:
                            AssetImage("assets/manOne-removebg-preview.png"),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff0a0057),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(90),
                            topRight: Radius.circular(90),
                            bottomLeft: Radius.circular(90),
                          ),
                        ),
                        child: Image.asset(
                          "assets/manTwo-removebg-preview.png",
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "Enjoy the new experience of\nchating with global friends",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Connect people arround the world for free",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(190, 158, 158, 158),
            ),
          ),
          const SizedBox(height: 42),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 136, 94, 253),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  nextScreen(context, const LoginPage());
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
