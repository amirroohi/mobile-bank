import 'package:flutter/material.dart';
import 'package:mobile_bank/views/bill/widgets/bill_input.dart';

import '../../transfer/widgets/transfer_continue_button.dart';

class AddNewBill extends StatefulWidget {
  const AddNewBill({super.key});

  @override
  State<AddNewBill> createState() => _AddNewBillState();
}

class _AddNewBillState extends State<AddNewBill> {
  final List<String> icons = [
    'assets/images/bargh.png',
    'assets/images/gas.png',
    'assets/images/aab.png',
    'assets/images/mokhaberat.jpg',
    'assets/images/hamrah.webp',
    // Add more asset paths here
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "نوع قبض را انتخاب کنید",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    icons.map((icon) {
                      return CircleAvatar(
                        backgroundColor: Colors.grey.shade200,
                        radius: 30,
                        backgroundImage: AssetImage(icon),
                        foregroundColor: Colors.grey,
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        BillInput(),
      ],
    );
  }
}
