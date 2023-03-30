import 'package:campus_connect/utilities/search_bar_widget.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchBarWidget("Search Settings"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(
                Icons.person_outline,
              color: Colors.blue,
            ),
            title: const Text(
              "Your App",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              "Manage and see information about your account.",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: (){},
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
              leading: const Icon(
                Icons.lock_outlined,
                color: Colors.blue,
              ),
            title: const Text("Security and Account Access",
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text(
              "Manage your account's security and track usage.",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: (){},
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.business_center_outlined,
              color: Colors.blue,
            ),
            title: const Text("Manage Advertisements",
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text(
              "Manage all your business advertisements and edit them.",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: (){},
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.security_outlined,
              color: Colors.blue,
            ),
            title: const Text("Privacy and Security",
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text(
              "Manage all the information you see and share to others on Campus Connect.",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: (){},
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.blue,
            ),
            title: const Text("Notifications",
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text(
              "Select the notifications you receive about your interests and activities.",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: (){},
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.accessibility_outlined,
              color: Colors.blue,
            ),
            title: const Text("Accessibility and Display",
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text(
              "Change accessibility settings and how Campus Connect content is displayed to you.",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: (){},
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.add_box_outlined,
              color: Colors.blue,
            ),
            title: const Text("Additional Resources",
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text(
              "Check out other resources and how they can be helpful to you.",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: (){},
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.monetization_on_outlined,
              color: Colors.blue,
            ),
            title: const Text("Monetization",
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text(
              "Manage monetization options and see how you can make more money.",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
