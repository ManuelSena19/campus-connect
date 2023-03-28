import 'package:flutter/material.dart';

Widget category(Function()? onPressed, String categoryName, IconData iconData) {
  return Row(
    children: [
      Icon(iconData),
      const SizedBox(width: 5,),
      Text(
        categoryName,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Expanded(child: Container()),
      IconButton(
        icon: const Icon(Icons.arrow_right_alt),
        onPressed: onPressed,
      ),
    ],
  );
}
