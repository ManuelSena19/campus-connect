import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget adCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return Material(
      child: GestureDetector(
    onTap: onTap,
    child: SizedBox(
      height: 250,
      width: 250,
      child: Column(
        children: [
          SizedBox(
              width: 250,
              height: 130,
              child:
                  Center(child: Image(image: NetworkImage(doc["imagePath"])))),
          const SizedBox(
            height: 8,
          ),
          Text(doc["productName"]),
          const SizedBox(
            height: 4,
          ),
          Text(doc["vendorName"])
        ],
      ),
    ),
  ));
}
