import 'package:flutter/material.dart';
import 'package:mobile_bank/views/transfer/transfer_confirmation_screen.dart';

import '../../../core/constants/app_constants.dart';
import '../../../widgets/slide_navigation.dart';
import '../../transfer/transfer_type_screen.dart';

Widget BillHistoryList(BuildContext context) {
  return Column(
    children: [
      BillHistoryCard(
        context: context,
        title: 'تلفن همراه',
        status: 'پرداخت شده',
        amount: '150,000 ریال',
        billId: '123123123',
      ),
      BillHistoryCard(
        context: context,
        title: 'برق',
        status: 'پرداخت نشده',
        amount: '250,000 ریال',
        billId: '456456456',
      ),
      // Add more as needed...
    ],
  );
}


Widget BillHistoryCard({
  required BuildContext context,
  required String title,
  required String status,
  required String amount,
  required String billId,
}) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    color: Colors.white,
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
          child: Column(
            children: [
              const SizedBox(height: 8), // Space for the bookmark icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const Icon(Icons.receipt_long, size: 28),
                ],
              ),
              const Divider(),
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("شناسه قبض: "), Text(" $billId")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("مبلغ: "), Text("$amount")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [const Text("وضعیت: "), Text("$status")],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30)
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        slideFromRight(TransferConfirmationScreen()),
                      );
                    },
                    child: const Text("پرداخت"),
                  ),
                ],
              ),
            ],
          ),
        ),

        // 🔖 Positioned Bookmark Icon
        const Positioned(
          top: 0,
          right: 8,
          child: Icon(Icons.bookmark, color: Colors.redAccent),
        ),
      ],
    ),
  );
}

