import 'package:flutter/material.dart';

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
          selectedColor: const Color(0xFF1D4B7E),
          backgroundColor: Colors.grey.shade200,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        );
      }).toList(),
    );
  }
}
