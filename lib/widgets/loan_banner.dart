import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

Widget loanBanner = Container(
  margin: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: AppColors.transparent,
    borderRadius: BorderRadius.circular(25),
  ),
  child: SizedBox(
    height: 110,
    width: double.infinity,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Image.asset(
        'assets/images/banner.png',
        fit: BoxFit.cover,
      ),
    ),
  ),
);

