import 'package:campus_connect/constants/routes.dart';
import 'package:campus_connect/utilities/category.dart';
import 'package:campus_connect/utilities/drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection("ads").snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: ListView(
                          children: [
                            category(() => null, "Food", Icons.fastfood),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              height: 40,
                              thickness: 3,
                              indent: 10,
                              endIndent: 10,
                            ),
                            category(() => null, "Books and Stationery",
                                Icons.school),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              height: 40,
                              thickness: 3,
                              indent: 10,
                              endIndent: 10,
                            ),
                            category(() => null, "Clothes and Accessories",
                                Icons.local_mall),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              height: 40,
                              thickness: 3,
                              indent: 10,
                              endIndent: 10,
                            ),
                            category(() => null, "Cosmetics", MdiIcons.lotion),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              height: 40,
                              thickness: 3,
                              indent: 10,
                              endIndent: 10,
                            ),
                            category(() => null, "Phones and Accessories",
                                Icons.phone_android),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              height: 40,
                              thickness: 3,
                              indent: 10,
                              endIndent: 10,
                            ),
                            category(() => null, "Computers and Accessories",
                                Icons.computer),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              height: 40,
                              thickness: 3,
                              indent: 10,
                              endIndent: 10,
                            ),
                            category(() => null, "Services",
                                Icons.miscellaneous_services),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              height: 40,
                              thickness: 3,
                              indent: 10,
                              endIndent: 10,
                            ),
                            category(() => null, "Drugs and Medical Products",
                                MdiIcons.pill),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              height: 40,
                              thickness: 3,
                              indent: 10,
                              endIndent: 10,
                            ),
                          ],
                        ),
                      );
                    }
                    return const Text(
                      "You don't any ads yet",
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
