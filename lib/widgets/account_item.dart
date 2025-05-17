import 'package:flutter/material.dart';
import '../../models/bank-account.dart';
import '../core/constants/app_constants.dart';

class AccountItem extends StatelessWidget {
  final BankAccount account;

  const AccountItem({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.bookmark_border, color: AppColors.white),
                    Icon(Icons.more_vert, color: AppColors.white),
                  ],
                ),
                Center(
                  child: Text(
                    account.iban,
                    style: const TextStyle(color: AppColors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      account.type,
                      style: const TextStyle(color: AppColors.white),
                    ),
                    Text(
                      account.accountNumber,
                      style: const TextStyle(color: AppColors.white),
                    ),
                  ],
                ),
                // optional dummy card number
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      account.ownerName,
                      style: const TextStyle(color: AppColors.white),
                    ),
                    const Text(
                      "6062 5610 1799 4305",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${account.balance.toStringAsFixed(0)} ریال",
                  style: const TextStyle(color: AppColors.white, fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.person, color: AppColors.white),
                    Icon(Icons.link, color: AppColors.white),
                    Icon(Icons.insert_drive_file, color: AppColors.white),
                    Icon(Icons.qr_code, color: AppColors.white),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
