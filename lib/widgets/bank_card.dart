import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/utils/text_mask.dart';
import '../models/bank-account.dart';

class BankCard extends StatelessWidget {
  final BankAccount account;
  // you can send assetsImage to this

  const BankCard({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [Color(0xFF1D4F7A), Color(0xFFA8A8A8), Color(0xFF2E75B6)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.more_vert, color: AppColors.white),
                      Icon(Icons.bookmark_border_outlined, color: AppColors.white),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    foregroundImage: AssetImage("assets/images/melal_icon.png"),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                account.iban,
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  account.accountNumber,
                  style: TextStyle(color: AppColors.white, fontSize: 18),
                ),
                Text(account.type, style: TextStyle(color: AppColors.white)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "شماره کارت ندارد", // You can add card number to your model if needed
                  style: TextStyle(color: AppColors.white, fontSize: 18),
                ),
                Text(account.ownerName, style: TextStyle(color: AppColors.white)),
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
                      "ریال",
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                    SizedBox(width: 4),
                    Text(
                      // account.balance.toStringAsFixed(0),
                      formatWithCommas(account.balance.toString()),
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
      ),
    );
  }
}
