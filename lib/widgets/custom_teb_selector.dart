import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

class CustomTabSelector extends StatelessWidget {
  final String selected;
  final Function(String) onChanged;
  final List<String> tabs;

  const CustomTabSelector({
    super.key,
    required this.selected,
    required this.onChanged,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tabs.map((tab) {
        final isSelected = tab == selected;
        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(tab),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                border: Border.all(color: AppColors.primary),
                borderRadius: tab == tabs.first
                    ? const BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )
                    : const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              child: Text(
                tab,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
