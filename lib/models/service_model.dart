import 'package:flutter/material.dart';

class ServiceItemModel {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  ServiceItemModel({required this.title, required this.icon, required this.onTap});
}
