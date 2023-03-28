import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget adCard(Function()? onTap, QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: NetworkImage(doc["imagePath"])),
          const SizedBox(height: 8,),
          Text(doc["productName"]),
          const SizedBox(height: 4,),
          Text(doc["vendorName"])
        ],
      ),
    ),
  );
}