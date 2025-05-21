import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../models/bank-account.dart';
import '../home/home_screen.dart';
import 'widgets/transfer_card_swiper.dart';
import 'widgets/transfer_continue_button.dart';
import 'widgets/transfer_details_form.dart';

class TransferFormScreen extends StatefulWidget {
  const TransferFormScreen({super.key});

  @override
  State<TransferFormScreen> createState() => _TransferFormScreenState();
}

class _TransferFormScreenState extends State<TransferFormScreen> {
  final TextEditingController _amountController = TextEditingController();
  late List<BankAccount> userAccounts;
  late int initialBookmarkedIndex;

  @override
  void initState() {
    super.initState();
    _amountController.addListener(() => setState(() {}));
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

    initialBookmarkedIndex = userAccounts.indexWhere((a) => a.isBookmarked);
    if (initialBookmarkedIndex == -1) initialBookmarkedIndex = 0;
  }

  void _toggleBookmark(int index) {
    setState(() {
      for (int i = 0; i < userAccounts.length; i++) {
        userAccounts[i].isBookmarked = i == index;
      }
      initialBookmarkedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("انتقال وجه", style: TextStyle(fontSize: 28))),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          automaticallyImplyLeading: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.home, size: 32),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Container(height: 820, color: AppColors.white),
                Container(height: 150, color: AppColors.primary),
                Positioned(
                  top: 25,
                  left: 15,
                  right: 15,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.white,
                      ),
                      child: Column(
                        children: [
                          TransferCardSwiper(
                            accounts: userAccounts,
                            initialIndex: initialBookmarkedIndex,
                            onBookmark: _toggleBookmark,
                          ),
                          TransferDetailsForm(amountController: _amountController),
                        ],
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 30,
                  right: 0,
                  left: 0,
                  child: TransferContinueButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
