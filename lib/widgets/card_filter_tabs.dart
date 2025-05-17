import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

class CardTypeTabs extends StatelessWidget {
  final List<String> types;
  final String selectedType;
  final Function(String) onSelect;

  const CardTypeTabs({super.key, required this.types, required this.selectedType, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: types.map((type) {
        final isSelected = type == selectedType;
        return Expanded(
          child: GestureDetector(
            onTap: () => onSelect(type),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                type,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? AppColors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
