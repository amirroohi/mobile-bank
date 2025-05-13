import 'package:flutter/material.dart';
import '../../models/bank-account.dart';

class AccountItem extends StatelessWidget {
  final BankAccount account;

  const AccountItem({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: const Color(0xFF1D4B7E),
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
                    Icon(Icons.bookmark_border, color: Colors.white),
                    Icon(Icons.more_vert, color: Colors.white),
                  ],
                ),
                Center(
                  child: Text(
                    account.iban,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      account.type,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      account.accountNumber,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                // optional dummy card number
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      account.ownerName,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Text(
                      "6062 5610 1799 4305",
                      style: TextStyle(color: Colors.white),
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
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.person, color: Colors.white),
                    Icon(Icons.link, color: Colors.white),
                    Icon(Icons.insert_drive_file, color: Colors.white),
                    Icon(Icons.qr_code, color: Colors.white),
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
