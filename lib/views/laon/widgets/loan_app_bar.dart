import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../home/home_screen.dart';

class LoanAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoanAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(
        child: Text("پرداخت قسط", style: TextStyle(fontSize: 28)),
      ),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      automaticallyImplyLeading: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(Icons.home, size: 32),
            tooltip: 'خانه',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
        ),
      ],
    );
  }
}
