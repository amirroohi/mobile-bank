import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

Widget loanBanner = Container(
  margin: const EdgeInsets.all(16),
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(16),
  ),
  child: Row(
    children: [
      CircleAvatar(
        backgroundColor: Colors.orange,
        child: Icon(Icons.favorite, color: AppColors.white),
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
