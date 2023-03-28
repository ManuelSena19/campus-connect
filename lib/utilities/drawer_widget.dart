import 'package:firebase_auth/firebase_auth.dart';
import 'package:campus_connect/constants/routes.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void pushRoute(String route) {
      Navigator.pushNamed(context, route);
    }

    void pushReplacementRoute(String route) {
      Navigator.pushReplacementNamed(context, route);
    }

    return Drawer(
      elevation: 0,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        children: [
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/logo.png"),
              radius: 30,
            ),
          ),
          const Divider(
            height: 40,
            thickness: 3,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
              pushRoute(homeScreenRoute);
            },
            leading: const Icon(Icons.home),
          ),
          ListTile(
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {},
            leading: const Icon(Icons.settings),
          ),
          ListTile(
            title: const Text(
              'Notifications',
              style: TextStyle(fontSize: 15),
            ),
            onTap: (){},
            leading: const Icon(Icons.notifications),
          ),
          ListTile(
            title: const Text(
              'Help and Support',
              style: TextStyle(fontSize: 15),
            ),
            onTap: (){},
            leading: const Icon(Icons.help),
          ),
          ListTile(
            title: const Text(
              'Feedback',
              style: TextStyle(fontSize: 15),
            ),
            onTap: (){},
            leading: const Icon(Icons.feedback_outlined),
          ),
          ListTile(
            title: const Text(
              'Sign Out',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              pushReplacementRoute(loginRoute);
            },
            leading: const Icon(Icons.logout),
          ),
          const Divider(
            height: 40,
            thickness: 3,
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(height: 250,),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Advertise your Business',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
