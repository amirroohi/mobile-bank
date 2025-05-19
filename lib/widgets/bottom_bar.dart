import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  Widget buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isSelected = selectedIndex == index;
    return InkWell(
      radius: 12,
      borderRadius: BorderRadius.all(Radius.circular(50)),
      onTap: () => onItemTapped(index),
      child: Container(
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.deepOrangeAccent : AppColors.primary,
              size: 28,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.deepOrangeAccent : AppColors.primary,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 35,
      borderRadius: BorderRadius.circular(30),
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          height: 80,
          color: AppColors.white,
          shape: const CircularNotchedRectangle(
          ),
          notchMargin: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildNavItem(
                icon: Icons.person_outline_rounded,
                label: 'پروفایل',
                index: 0,
              ),
              buildNavItem(
                icon: Icons.account_balance_wallet_outlined,
                label: 'خدمات',
                index: 1,
              ),
              const SizedBox(width: 70), // Space for FAB
              buildNavItem(
                icon: Icons.credit_card_outlined,
                label: 'کارت',
                index: 2,
              ),
              buildNavItem(
                icon: Icons.account_balance,
                label: 'سپرده',
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
