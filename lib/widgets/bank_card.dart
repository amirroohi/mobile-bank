import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

class BankCard extends StatelessWidget {
  final String iban;
  final String accountNumber;
  final String cardNumber;
  final String accountType;
  final String owner;
  final String balance;

  const BankCard({
    super.key,
    required this.iban,
    required this.accountNumber,
    required this.cardNumber,
    required this.accountType,
    required this.owner,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [ Color(0xFF2E75B6),Color(0xFF8A8A8A), Color(0xFF2E75B6)],
          begin : Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Icon(Icons.more_vert, color: AppColors.white),
                Icon(Icons.bookmark_border_outlined, color: AppColors.white),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              iban,
              style: TextStyle(color: AppColors.white, fontSize: 18),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                accountNumber,
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
              Text(accountType, style: TextStyle(color: AppColors.white)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                cardNumber,
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),

              Text(owner, style: TextStyle(color: AppColors.white)),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.group, color: AppColors.white),
                  SizedBox(width: 6),
                  Icon(Icons.account_balance, color: AppColors.white),
                  SizedBox(width: 6),
                  Icon(Icons.compare_arrows, color: AppColors.white),
                  SizedBox(width: 6),
                  Icon(Icons.credit_card, color: AppColors.white),
                ],
              ),
              Row(
                children: [
                  Text(
                    "ريال",
                    style: TextStyle(color: AppColors.white, fontSize: 18),
                  ),
                  SizedBox(width: 4),
                  Text(
                    "$balance",
                    style: TextStyle(color: AppColors.white, fontSize: 18),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.visibility_off, color: AppColors.white),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
