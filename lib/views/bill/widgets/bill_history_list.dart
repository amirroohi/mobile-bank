import 'package:flutter/material.dart';

Widget BillHistoryList() {
  return Column(
    children: [
      BillHistoryCard(
        title: 'تلفن همراه',
        status: 'پرداخت شده',
        amount: '150,000 ریال',
        billId: '123123123',
      ),
      BillHistoryCard(
        title: 'برق',
        status: 'پرداخت نشده',
        amount: '250,000 ریال',
        billId: '456456456',
      ),
      BillHistoryCard(
        title: 'برق',
        status: 'پرداخت نشده',
        amount: '250,000 ریال',
        billId: '78978978',
      ),
      BillHistoryCard(
        title: 'برق',
        status: 'پرداخت نشده',
        amount: '250,000 ریال',
        billId: '78978978',
      ),
      BillHistoryCard(
        title: 'برق',
        status: 'پرداخت نشده',
        amount: '250,000 ریال',
        billId: '78978978',
      ),
    ],
  );
}

Widget BillHistoryCard({
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
      padding: const EdgeInsets.all(12.0),
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
                  backgroundColor: Color(0xFF1D4B7E),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Text("پرداخت"),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
