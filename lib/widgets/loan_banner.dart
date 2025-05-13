import 'package:flutter/material.dart';

Widget loanBanner = Container(
  margin: const EdgeInsets.all(16),
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
  ),
  child: Row(

    children: [
      CircleAvatar(
        backgroundColor: Colors.orange,
        child: Icon(Icons.favorite, color: Colors.white),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: Text(
          'پرداخت بیش از ۱۲۳۰ میلیارد ریال وام ازدواج از سوی موسسه اعتباری ملل',
          style: TextStyle(fontSize: 13),
        ),
      ),
    ],
  ),
);
