import 'package:flutter/material.dart';
import '../../models/card_model.dart';

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
          height: 200,
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1D4B7E),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            spacing: 7,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.bookmark_border, color: Colors.white),
                ],
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  card.iban,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    card.ownerName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    card.cardNumber,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "${card.balance.toStringAsFixed(0)} ريال",
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  Text(
                    "تاریخ انقضا: ${card.expiry}",
                    style: const TextStyle(color: Colors.white70),
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
