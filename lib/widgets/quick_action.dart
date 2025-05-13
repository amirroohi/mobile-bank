import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onActionSelected;

  QuickActions({super.key, required this.selectedIndex, required this.onActionSelected});

  final List<Map<String, dynamic>> _actions = [
    {'icon': Icons.account_balance, 'label': 'تسهیلات'},
    {'icon': Icons.sim_card, 'label': 'شارژ'},
    {'icon': Icons.receipt_long, 'label': 'قبض'},
    {'icon': Icons.credit_card, 'label': 'انتقال وجه'},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(_actions.length, (index) {
        final isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () => onActionSelected(index),
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.deepOrangeAccent : Colors.white70,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  _actions[index]['icon'],
                  color: isSelected ? Colors.white : Color(0xFF1D4B7E),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                _actions[index]['label'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
