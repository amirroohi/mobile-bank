import 'package:flutter/material.dart';

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
          colors: [Color(0xFF1D4B7E), Color(0xFF2E75B6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
                Icon(Icons.more_vert, color: Colors.white),
                Icon(Icons.bookmark_border_outlined, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              iban,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                accountNumber,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(accountType, style: TextStyle(color: Colors.white)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                cardNumber,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),

              Text(owner, style: TextStyle(color: Colors.white)),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.group, color: Colors.white),
                  SizedBox(width: 6),
                  Icon(Icons.account_balance, color: Colors.white),
                  SizedBox(width: 6),
                  Icon(Icons.compare_arrows, color: Colors.white),
                  SizedBox(width: 6),
                  Icon(Icons.credit_card, color: Colors.white),
                ],
              ),
              Row(
                children: [
                  Text("ريال", style: TextStyle(color: Colors.white,fontSize: 18)),
                  SizedBox(width: 4),
                  Text("$balance", style: TextStyle(color: Colors.white,fontSize: 18)),
                  SizedBox(width: 4),
                  Icon(Icons.visibility_off, color: Colors.white),
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
