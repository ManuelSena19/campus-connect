import 'package:flutter/material.dart';

Widget searchBarWidget(String labelText) {
  return GestureDetector(
    child: Center(
      child: Container(
          width: 300,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Container()),
              const Icon(Icons.search),
              Text(
                labelText,
                style: const TextStyle(fontSize: 15),
              ),
              Expanded(child: Container()),
            ],
          )),
    ),
  );
}
