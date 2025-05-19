import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

class AccountTypeTabs extends StatelessWidget {
  final List<String> types;
  final String selectedType;
  final Function(String) onSelect;

  const AccountTypeTabs({
    super.key,
    required this.types,
    required this.selectedType,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: types.map((type) {
        final bool isSelected = type == selectedType;
        return ChoiceChip(
          label: Text(type),
          selected: isSelected,
          onSelected: (_) => onSelect(type),
          selectedColor: AppColors.primary,
          backgroundColor: Colors.grey.shade200,
          labelStyle: TextStyle(
            color: isSelected ? AppColors.white : AppColors.primary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        );
      }).toList(),
    );
  }
}
