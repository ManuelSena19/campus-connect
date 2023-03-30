import 'package:flutter/material.dart';
import '../constants/routes.dart';

PreferredSizeWidget appBarWidget(BuildContext context){
  return AppBar(
    backgroundColor: Colors.blue,
    title: GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, homeScreenRoute);
      },
      child: const CircleAvatar(
        backgroundImage: AssetImage("assets/logo.png"),
        radius: 20,
      ),
    ),
    centerTitle: true,
    elevation: 0,
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
      ),
      const SizedBox(
        width: 3,
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications),
      ),
    ],
  );
}