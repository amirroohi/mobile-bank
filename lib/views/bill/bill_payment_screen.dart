import 'package:flutter/material.dart';
import 'package:mobile_bank/views/bill/widgets/add_new_bill.dart';
import 'package:mobile_bank/views/bill/widgets/bill_history_list.dart';
import '../../core/constants/app_constants.dart';
import '../../models/bank-account.dart';
import '../../widgets/account_item.dart';
import '../home/home_screen.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class BillPaymentScreen extends StatefulWidget {
  const BillPaymentScreen({super.key});

  @override
  State<BillPaymentScreen> createState() => _BillPaymentScreenState();
}

class _BillPaymentScreenState extends State<BillPaymentScreen> {
  final BankAccount account = BankAccount(
    ownerName: "مینا علمی",
    accountNumber: "051511242000000150",
    iban: "IR890750051511242000000150",
    type: "سپرده قرض الحسنه",
    balance: 150000000,
    logoAsset: "assets/images/bank_logo.png",
  );
  String selectedTab = "پرداخت قبض";
  final TextEditingController _amountController = TextEditingController();
  String amountInWords = '';

  @override
  void initState() {
    super.initState();
    _amountController.addListener(() {
      setState(() {
        final value = _amountController.text;
        if (value.isNotEmpty) {
          amountInWords = value.toWord(); // Ensure this works with your package
        } else {
          amountInWords = '';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("پرداخت قبض", style: TextStyle(fontSize: 28)),
          ),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          automaticallyImplyLeading: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: const Icon(Icons.home, size: 32),
                tooltip: 'خانه',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: double.infinity,
                    minHeight: 770,
                    maxHeight: 790,
                  ),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
                Container(height: 150, color: AppColors.primary),
                Positioned(
                  top: 25,
                  left: 15,
                  right: 15,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 800,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: DefaultTabController(
                        length: 2,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 240,
                              child: PageView.builder(
                                controller: PageController(
                                  viewportFraction: 0.9,
                                ),
                                itemCount: 4,
                                itemBuilder:
                                    (context, index) =>
                                        AccountItem(account: account),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Tabs
                            Container(
                              width: 400,
                              height: 60, // 👈 Desired tab height
                              child: TabBar(
                                indicatorPadding: EdgeInsets.only(bottom: 8),
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.black,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.primary,
                                ),
                                tabs: const [
                                  Tab(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,

                                      children: [
                                        Icon(Icons.receipt_long, size: 20),
                                        SizedBox(width: 4),
                                        Text('پرداخت قبض', style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                  Tab(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add, size: 20),
                                        SizedBox(width: 4),
                                        Text('ثبت قبض جدید', style: TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 16),

                            // TabBarView with two screens
                            Expanded(
                              child: TabBarView(
                                children: [
                                  // ➤ Tab 1: History
                                  SingleChildScrollView(
                                    child: BillHistoryList(),
                                  ),
                                  // ➤ Tab 2: Bill Payment
                                  SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 32),
                                        AddNewBill(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
