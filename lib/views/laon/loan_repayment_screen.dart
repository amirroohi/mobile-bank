import 'package:flutter/material.dart';
import 'package:mobile_bank/core/constants/app_constants.dart';
import 'package:mobile_bank/views/transfer/transfer_type_screen.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../models/bank-account.dart';
import '../../widgets/account_item.dart';
import '../home/home_screen.dart';

class LoanRepaymentScreen extends StatefulWidget {
  const LoanRepaymentScreen({super.key});

  @override
  State<LoanRepaymentScreen> createState() => _LoanRepaymentScreenState();
}

class _LoanRepaymentScreenState extends State<LoanRepaymentScreen> {
  final BankAccount account = BankAccount(
    ownerName: "مینا علمی",
    accountNumber: "051511242000000150",
    iban: "IR890750051511242000000150",
    type: "سپرده قرض الحسنه",
    balance: 150000000,
    logoAsset: "assets/images/bank_logo.png",
  );

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
            child: Text("پرداخت قسط", style: TextStyle(fontSize: 28)),
          ),
          backgroundColor: const Color(0xFF1D4B7E),
          foregroundColor: Colors.white,
          automaticallyImplyLeading: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: const Icon(Icons.home,size: 32,),
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
                Container(height: 150, color: const Color(0xFF1D4B7E)),
                Positioned(
                  top: 25,
                  left: 15,
                  right: 15,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 570,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 240,
                            child: PageView.builder(
                              controller: PageController(viewportFraction: 0.9),
                              itemCount: 4,
                              // you can replace with `accounts.length` if you have a list
                              itemBuilder: (context, index) {
                                return AccountItem(account: account);
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          // 📥 Destination input
                          TextField(
                            decoration: InputDecoration(
                              counterText: "",
                              labelText: "شماره تسهیلات",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              suffixIcon: InkWell(
                                borderRadius: BorderRadius.circular(50),

                                onTap: () {},
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.perm_contact_calendar_outlined,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),

                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 30),
                          // 💰 Amount input
                          TextField(
                            maxLength: 9,
                            controller: _amountController,
                            decoration: InputDecoration(
                              suffix: Text("ريال"),
                              counterText: "",
                              labelText: "مبلغ قسط",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 40,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    amountInWords,
                                    style: const TextStyle(
                                      color: Color(0xFF246C1D),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),

                          // 📝 Description input
                          Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    labelText: "تعداد اقساط",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFEF7F00),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 18,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => TransferTypeScreen(),
                                      ),
                                    );
                                    // TODO: Handle transfer logic or navigation
                                  },
                                  child: const Text(
                                    "محاسبه اقساط",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // ✅ Submit button
                Positioned(
                  top: 640,
                  right: 0,
                  left: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D4B7E),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransferTypeScreen(),
                          ),
                        );
                        // TODO: Handle transfer logic or navigation
                      },
                      child: const Text(
                        "ادامه",
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
