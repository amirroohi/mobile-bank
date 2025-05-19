import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

class ServiceItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;


  const ServiceItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: const Color(0xFFE2E9F3),
            child: Icon(icon, color: AppColors.primary, size: 28),
          ),
          const SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 12, color: AppColors.primary)),
        ],
      ),
    );
  }
}
