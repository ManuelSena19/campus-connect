import 'package:campus_connect/utilities/divider_widget.dart';
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
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/logo.png"),
                  radius: 45,
                ),
                SizedBox(height: 10,),
                Text(
                  "Campus Connect",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
                ),
              ],
            ),
          ),
          dividerWidget(),
          Expanded(
            flex: 5,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  title: const Text(
                    "Home",
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {
                    pushRoute(homeScreenRoute);
                  },
                  leading: const Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Settings',
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {
                    pushRoute(settingsRoute);
                  },
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Notifications',
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {},
                  leading: const Icon(
                    Icons.notifications,
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Help and Support',
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {},
                  leading: const Icon(
                    Icons.help,
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: const Text(
                    'Feedback',
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {},
                  leading: const Icon(
                    Icons.feedback_outlined,
                    color: Colors.blue,
                  ),
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
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.blue,
                  ),
                ),
                const Divider(
                  height: 40,
                  thickness: 3,
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            ),
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {
                pushRoute(createAdRoute);
              },
              child: const Text(
                'Advertise your Business',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
