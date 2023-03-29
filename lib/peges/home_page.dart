import 'package:chat_app/helper/helper_function.dart';
import 'package:chat_app/peges/auth/login_page.dart';
import 'package:chat_app/peges/profile_page.dart';
import 'package:chat_app/peges/search_page.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/service/database_service.dart';
import 'package:chat_app/shared/constants.dart';
import 'package:chat_app/widgets/group_tile.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";
  String email = "";
  AuthService authService = AuthService();
  Stream? group;
  bool _isLoading = false;
  String groupName = "";
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget bottomNavPages() {
    switch (selectedIndex) {
      case 0:
        return groupList();
        break;
      case 1:
        return ProfilePage(
          userName: userName,
          email: email,
        );
        break;
      case 2:
        return SafeArea(
          child: ListTile(
            tileColor: Colors.grey,
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
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
        break;
      default:
        return Container();
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  // string manipulation
  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  gettingUserData() async {
    await HelperFunctions.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunctions.getUserNameFromSF().then((value) {
      setState(() {
        userName = value!;
      });
    });

    // getting the list of snapshots in our stream
    await DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
        .getUserGroups()
        .then((snapshot) {
      setState(() {
        group = snapshot;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavPages(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryClr,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        unselectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }

  popUpDialogue(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text(
                "Create a group",
                textAlign: TextAlign.left,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _isLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : TextField(
                          onChanged: (value) {
                            setState(() {
                              groupName = value;
                            });
                          },
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text("CANCEL"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (groupName != "") {
                      setState(() {
                        _isLoading = true;
                      });
                      DatabaseServices(
                              uid: FirebaseAuth.instance.currentUser!.uid)
                          .createGroup(userName,
                              FirebaseAuth.instance.currentUser!.uid, groupName)
                          .whenComplete(() {
                        _isLoading = false;
                      });
                      Navigator.of(context).pop();
                      showSnackBar(
                          context, Colors.green, "Group created successfully.");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text("CREATE"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  groupList() {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          popUpDialogue(context);
        },
        elevation: 0,
        backgroundColor: primaryClr,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              nextScreen(context, const SearchPage());
            },
            icon: const Icon(Icons.search),
          ),
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryClr,
        title: const Text(
          "Groups",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: group,
        builder: (context, AsyncSnapshot snapshot) {
          // make some checks
          if (snapshot.hasData) {
            if (snapshot.data["groups"] != null) {
              if (snapshot.data["groups"].length != 0) {
                return ListView.builder(
                  itemCount: snapshot.data["groups"].length,
                  itemBuilder: (context, index) {
                    int reverseIndex =
                        snapshot.data["groups"].length - index - 1;
                    return GroupTile(
                      groupId: getId(snapshot.data["groups"][reverseIndex]),
                      groupName: getName(snapshot.data["groups"][reverseIndex]),
                      userName: snapshot.data["fullName"],
                    );
                  },
                );
              } else {
                return noGroupWidget();
              }
            } else {
              return noGroupWidget();
            }
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
        },
      ),
    );
  }

  noGroupWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              popUpDialogue(context);
            },
            child: Icon(
              Icons.add_circle,
              color: Colors.grey[700],
              size: 75,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "You've not joined any groups, tap on the add icon to create a group or search from top search button.",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
