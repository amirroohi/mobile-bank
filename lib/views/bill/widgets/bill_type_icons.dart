
import 'package:flutter/material.dart';

Widget BillTypeIcons() {
  final List<String> icons = [
    'assets/images/bargh.png',
    'assets/images/gas.png',
    'assets/images/aab.png',
    'assets/images/mokhaberat.jpg',
    'assets/images/hamrah.webp',
    // Add more asset paths here
  ];

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("نوع قبض را انتخاب کنید",style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: icons.map((icon) {
            return CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              radius: 30,
              backgroundImage: AssetImage(icon),
              foregroundColor: Colors.grey,
            );
          }).toList(),
        ),
      ],
    ),
  );
}
