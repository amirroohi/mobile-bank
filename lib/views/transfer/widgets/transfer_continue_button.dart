import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../widgets/slide_navigation.dart';
import '../transfer_type_screen.dart';

class TransferContinueButton extends StatelessWidget {
  const TransferContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: () {
          Navigator.push(
            context,
            slideFromRight(TransferTypeScreen()),
          );
        },
        child: const Text(
          "ادامه",
          style: TextStyle(fontSize: 18, color: AppColors.white),
        ),
      ),
    );
  }
}
