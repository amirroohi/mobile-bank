import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:mobile_bank/core/constants/app_constants.dart';
import 'package:mobile_bank/views/transfer/transfer_type_screen.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../core/utils/number_to_word.dart';
import '../../models/bank-account.dart';
import '../../widgets/bank_card.dart';
import '../../widgets/price_input_field.dart';
import '../home/home_screen.dart';

class LoanRepaymentScreen extends StatefulWidget {
  const LoanRepaymentScreen({super.key});

  @override
  State<LoanRepaymentScreen> createState() => _LoanRepaymentScreenState();
}

class _LoanRepaymentScreenState extends State<LoanRepaymentScreen> {
  final TextEditingController _amountController = TextEditingController();
  String amountInWords = '';
  int selectedQuickActionIndex = -1;
  late List<BankAccount> userAccounts;
  late int initialBookmarkedIndex;
  void _toggleBookmark(int index) {
    setState(() {
      for (int i = 0; i < userAccounts.length; i++) {
        userAccounts[i].isBookmarked = i == index;
      }
      initialBookmarkedIndex = index;
    });
  }
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
    // Define local accounts
    userAccounts = [
      BankAccount(
        ownerName: "مینا علمی",
        accountNumber: "051511242000000150",
        iban: "IR890750051511242000000150",
        type: "سپرده قرض الحسنه",
        balance: 150000000,
        logoAsset: 'assets/images/melal_icon.png',
        isBookmarked: false,
      ),
      BankAccount(
        ownerName: "علی احمدی",
        accountNumber: "051511242000000151",
        iban: "IR230750051511242000000151",
        type: "سپرده کوتاه مدت",
        balance: 87500000,
        logoAsset: 'assets/images/melal_icon.png',
        isBookmarked: true, // this one is initially selected
      ),
      BankAccount(
        ownerName: "خودم",
        accountNumber: "051511242000000151",
        iban: "IR230750051511242000000151",
        type: "سپرده بلند مدت",
        balance: 87500000,
        logoAsset: 'assets/images/melal_icon.png',
        isBookmarked: false, // this one is initially selected
      ),
      // Add more accounts if needed
    ];

    // Find initial bookmarked account index
    initialBookmarkedIndex = userAccounts.indexWhere((a) => a.isBookmarked);
    if (initialBookmarkedIndex == -1) initialBookmarkedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("پرداخت قسط", style: TextStyle(fontSize: 28)),
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
                Container(height: 790, color: Colors.white),
                Container(height: 150, color: AppColors.primary),
                Positioned(
                  top: 25,
                  left: 15,
                  right: 15,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 590,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          /// 📇 Swiper with BankCards
                          SizedBox(
                            height: 240,
                            child: Swiper(
                              index: initialBookmarkedIndex, //  start from bookmarked
                              layout: SwiperLayout.TINDER,
                              itemWidth: 500,
                              itemHeight: 300,
                              itemBuilder: (context, index) {
                                return BankCard(account: userAccounts[index],onBookmarkPressed: ()=>_toggleBookmark(index),);
                              },
                              itemCount: userAccounts.length,
                            ),
                          ),
                          const SizedBox(height: 30),

                          /// 📋 Loan number
                          TextField(
                            decoration: InputDecoration(
                              counterText: "",
                              labelText: "شماره تسهیلات",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.perm_contact_calendar_outlined,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 30),

                          /// 💰 Amount
                          PriceInputField(controller: _amountController),
                          const SizedBox(height: 10),

                          /// 🔤 Amount in words
                          NumberToWordsText(
                            number: _amountController.text.isEmpty
                                ? null
                                : int.tryParse(_amountController.text
                                .replaceAll(',', '')),
                            textStyle: TextStyle(
                              fontSize: 13,
                              color: Colors.green.shade800,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 20),

                          /// 📅 Installments + Button
                          Row(
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
                              const SizedBox(width: 8),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    const Color(0xFFEF7F00),
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
                                        builder: (context) =>
                                        const TransferTypeScreen(),
                                      ),
                                    );
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

                /// ✅ Continue Button
                Positioned(
                  top: 640,
                  left: 40,
                  right: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransferTypeScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "ادامه",
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
