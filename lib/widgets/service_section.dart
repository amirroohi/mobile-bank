import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

class ServiceSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const ServiceSection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Divider(color: Colors.grey.shade200),
        Text(
          title,
          style:  TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(spacing: 20, runSpacing: 20, children: items),
      ],
    );
  }
}
