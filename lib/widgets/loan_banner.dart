import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

Widget loanBanner = Container(
  margin: const EdgeInsets.all(16),
  // padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: AppColors.transparent,
    borderRadius: BorderRadius.circular(25),
  ),
  child: SizedBox(
    height: 110,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/images/banner.png'),
        ),
      ],
    ),
  ),
);
