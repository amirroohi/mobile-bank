import 'package:flutter/material.dart';
import '../../models/card_model.dart';
import '../core/constants/app_constants.dart';

class CardItem extends StatelessWidget {
  final BankCard card;
  final VoidCallback onBlockPressed;
  final VoidCallback onToggleSecondPassword;

  const CardItem({
    super.key,
    required this.card,
    required this.onBlockPressed,
    required this.onToggleSecondPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Card Display
        Container(
          width: 360,
          height: 220,
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors:  [
                Color(0xFF205FA1), // rich deep blue
                Color(0xFF2E75B6), // your existing nice blue
                Color(0xFF6FB1FC), // energetic soft blue
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            spacing: 7,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    foregroundImage: AssetImage("assets/images/melal_icon.png"),
                  ),
                  Icon(Icons.bookmark_border, color: AppColors.white),

                ],
              ),
              Center(
                child: Text(
                  card.iban,
                  style:  TextStyle(color: AppColors.white),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    card.ownerName,
                    style:  TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    card.cardNumber,
                    style:  TextStyle(color: AppColors.white, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "${card.balance.toStringAsFixed(0)} ريال",
                    style:  TextStyle(color: AppColors.white),
                  ),
                  const Spacer(),
                  Text(
                    "تاریخ انقضا: ${card.expiry}",
                    style:  TextStyle(color: AppColors.white),
                  ),
                ],
              ),
            ],
          ),
        ),

      ],
    );
  }
}
