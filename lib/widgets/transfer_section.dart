import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

class TransferSection extends StatelessWidget {
  final List<Map<String, String>> users = [
    {"name": "مینا علمی"},
    {"name": "امیر غفاری"},
  ];

  TransferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'انتقال وجه',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'مشاهده',
                        style: TextStyle(
                          color: AppColors.secondary,
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: AppColors.secondary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Avatars Row
            Row(
              children: [
                // Add button
                Column(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey.shade200,
                      child: const Icon(Icons.add, color: Colors.black),
                    ),
                  ],
                ),
                for (var user in users)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.lightGreen.shade50,
                            child: const Icon(
                              Icons.person_outline,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            user['name']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),

            // Transaction History
            // A sample transaction row
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Transaction History
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'سوابق تراکنش',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'مشاهده',
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontSize: 12,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: AppColors.secondary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Scrollable list inside fixed height
                  SizedBox(
                    height: 260, // adjust based on your design
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: const [
                        TransactionItem(
                          name: 'امیر غفاری',
                          type: 'انتقال وجه پایا',
                          date: '20/08/1403 ساعت14:56',
                          amount: '25000-',
                          color: Colors.red,
                        ),
                        TransactionItem(
                          name: 'ناشناس',
                          type: 'واریز وجه',
                          date: '20/08/1403 ساعت14:56',
                          amount: '25000+',
                          color: Colors.green,
                        ),
                        TransactionItem(
                          name: 'امیر غفاری',
                          type: 'انتقال وجه پایا',
                          date: '20/08/1403 ساعت14:56',
                          amount: '25000-',
                          color: Colors.red,
                        ),
                        TransactionItem(
                          name: 'امیر غفاری',
                          type: 'انتقال وجه پایا',
                          date: '20/08/1403 ساعت14:56',
                          amount: '25000-',
                          color: Colors.red,
                        ),
                        TransactionItem(
                          name: 'امیر غفاری',
                          type: 'انتقال وجه پایا',
                          date: '20/08/1403 ساعت14:56',
                          amount: '25000-',
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String name;
  final String type;
  final String date;
  final String amount;
  final Color color;

  const TransactionItem({
    required this.name,
    required this.type,
    required this.date,
    required this.amount,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 170,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Color.fromRGBO(241, 241, 241, 1.0),
                  child: Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      type,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(amount, style: TextStyle(fontSize: 14, color: color)),
        ],
      ),
    );
  }
}
