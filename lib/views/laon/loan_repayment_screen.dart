import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:mobile_bank/core/constants/app_constants.dart';
import 'package:mobile_bank/views/laon/widgets/account_swiper.dart';
import 'package:mobile_bank/views/laon/widgets/installment_section.dart';
import 'package:mobile_bank/views/laon/widgets/loan_app_bar.dart';
import 'package:mobile_bank/views/laon/widgets/loan_form_fields.dart';
import 'package:mobile_bank/views/transfer/transfer_type_screen.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../core/utils/number_to_word.dart';
import '../../models/bank-account.dart';
import '../../widgets/bank_card.dart';
import '../../widgets/price_input_field.dart';
import '../home/home_screen.dart';
import '../transfer/widgets/transfer_continue_button.dart';

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
        appBar: const LoanAppBar(),
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
                      padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          AccountSwiper(
                            accounts: userAccounts,
                            initialIndex: initialBookmarkedIndex,
                            onBookmark: _toggleBookmark,
                          ),
                          LoanFormFields(amountController: _amountController),
                          const InstallmentSection(),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: TransferContinueButton()
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
