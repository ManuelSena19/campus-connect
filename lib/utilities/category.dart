import 'package:campus_connect/screens/category_screen.dart';
import 'package:flutter/material.dart';

Widget category(BuildContext context, String categoryName, IconData iconData) {
  return Row(
    children: [
      Icon(iconData),
      const SizedBox(
        width: 5,
      ),
      Text(
        categoryName,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Expanded(child: Container()),
      IconButton(
        icon: const Icon(Icons.arrow_right_alt),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CategoryScreen(category: categoryName)));
        },
      ),
    ],
  );
}
