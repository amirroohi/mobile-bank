import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';

class TransferMethodButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const TransferMethodButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 14, color: AppColors.white)),
                Text(subtitle, style: TextStyle(fontSize: 11, color: Color(0xFFDFDFDF))),
              ],
            ),
            Icon(Icons.arrow_forward, color: AppColors.white),
          ],
        ),
      ),
    );
  }
}
