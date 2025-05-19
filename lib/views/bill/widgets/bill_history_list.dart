import 'package:flutter/material.dart';

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
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    color: Colors.white,
    elevation: 10,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: Column(
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Icon(Icons.receipt_long, size: 28),
            ],
          ),
          Divider(),
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("شناسه قبض: "), Text(" $billId")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("مبلغ: "), Text("$amount")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("وضعیت: "), Text("$status")],
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
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    slideFromRight(TransferTypeScreen()),
                  );
                },
                child: Text("پرداخت"),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
