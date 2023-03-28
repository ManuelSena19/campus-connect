import 'package:firebase_auth/firebase_auth.dart';
import 'package:campus_connect/constants/routes.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void pushRoute(String route){
      Navigator.pushNamed(context, route);
    }

    void pushReplacementRoute(String route){
      Navigator.pushReplacementNamed(context, route);
    }

    return Drawer(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
        children: [
          ListTile(
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 15),
            ),
            onTap: (){
              pushRoute(homeScreenRoute);
            },
            leading: const Icon(Icons.home),
          ),
          ListTile(
            title: const Text(
              'Sign Out',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () async{
              await FirebaseAuth.instance.signOut();
              pushReplacementRoute(loginRoute);
            },
            leading: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
