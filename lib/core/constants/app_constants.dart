import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF1D4B7E);
  static const secondary =Color(0xFFFF6E40);
  static const background = Color.fromRGBO(245, 245, 245, 1);
  static const lightGrey = Color(0xFFF3F6FA);
  static const white = Colors.white;
  static const darkPrimary = Colors.white;
  static const darkSecondary = Colors.white;
}

class AppTextStyles {
  static const headline = TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
  static const body = TextStyle(fontSize: 16);
  static const cardTitle = TextStyle(fontSize: 20, color: AppColors.primary);
  static const button = TextStyle(color: AppColors.primary);
}

class AppStrings {
  static const cardScreenTitle = "فهرست کارت ها";
  static const noCardFound = "کارتی یافت نشد";
  static const cardTypes = ["نقدی", "اعتباری", "بن کارت", "تنخواه"];
  static const blockCard = 'مسدودی موقت/مسدودی دائم';
  static const secondPassword = 'فعال/غیرفعال رمز دوم';
  static const snackbarBlocked = 'مسدودی کارت اجرا شد';
  static const snackbarPassword = 'رمز دوم تغییر کرد';
}

class AppSizes {
  static const buttonWidth = 250.0;
  static const buttonHeight = 50.0;
  static const cardHeight = 260.0;
  static const spacing = 16.0;
}
