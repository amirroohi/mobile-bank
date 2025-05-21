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
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 6),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor:
                  isSelected ? AppColors.primary : const Color(0xFFE2E9F3),
                  child: Icon(
                    icon,
                    color: isSelected ? Colors.white : AppColors.primary,
                    size: 28,
                  ),
                ),
                if (isSelected)
                  const Positioned(
                    top: -6,
                    right: -6,
                    child: Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AppColors.primary : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
