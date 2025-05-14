import 'package:flutter/material.dart';
import 'package:mobile_bank/views/charge/buy_charge_screen.dart';
import 'package:mobile_bank/views/laon/loan_repayment_screen.dart';
import 'package:mobile_bank/views/transfer/transfer_form_screen.dart';

import '../views/bill/bill_payment_screen.dart';

class QuickActions extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onActionSelected;

  QuickActions({
    super.key,
    required this.selectedIndex,
    required this.onActionSelected,
  });

  final List<Map<String, dynamic>> _actions = [
    {
      'icon': Icons.account_balance,
      'label': 'تسهیلات',
      'screen': LoanRepaymentScreen(), // Replace with your actual screen
    },
    {'icon': Icons.sim_card, 'label': 'شارژ', 'screen': BuyChargeScreen()},
    {'icon': Icons.receipt_long, 'label': 'قبض', 'screen': BillPaymentScreen()},
    {
      'icon': Icons.credit_card,
      'label': 'انتقال وجه',
      'screen': TransferFormSection(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(_actions.length, (index) {
        final isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () {
            onActionSelected(index);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => _actions[index]['screen'],
              ),
            );
          },
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.deepOrangeAccent : Colors.white70,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  _actions[index]['icon'],
                  color: isSelected ? Colors.white : Color(0xFF1D4B7E),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                _actions[index]['label'],
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        );
      }),
    );
  }
}
