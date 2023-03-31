import 'package:campus_connect/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  void _pushRoute(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Your Account"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            const Text(
              "See information about your account, change your password or learn about your deactivation options",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(
                Icons.person_outline,
                color: Colors.blue,
              ),
              title: const Text(
                "Account Information",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                "See account information like your username and email address.",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                _pushRoute(accountInfoRoute);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(
                Icons.lock_outlined,
                color: Colors.blue,
              ),
              title: const Text(
                "Change Password",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                "Change your password or reset it at anytime.",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                _pushRoute(resetPasswordRoute);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: const Icon(
                Icons.cancel_outlined,
                color: Colors.blue,
              ),
              title: const Text(
                "Deactivate Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                "Check out how you can deactivate your Campus Connect account.",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  final String _email = FirebaseAuth.instance.currentUser!.email.toString();
  late final DocumentSnapshot snapshot;

  Future<String> getUsername(String email) async {
    final snapshot =
        await FirebaseFirestore.instance.collection('users').doc(email).get();
    if (snapshot.exists) {
      final data = snapshot.data()!;
      final username = data['username'];
      return username;
    }
    throw "User not found";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Account Information"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView(
          children: [
            FutureBuilder<String>(
              future: getUsername(_email),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListTile(
                    title: const Text(
                      "Username",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      snapshot.data!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            ListTile(
              title: const Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                _email,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              title: const Text(
                "Sign Out",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                "Sign out of your account",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
