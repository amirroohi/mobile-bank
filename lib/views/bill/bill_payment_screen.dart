import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mobile_bank/views/bill/widgets/add_new_bill.dart';
import 'package:mobile_bank/views/bill/widgets/bill_history_list.dart';
import '../../core/constants/app_constants.dart';
import '../../models/bank-account.dart';
import '../../widgets/account_item.dart';
import '../../widgets/bank_card.dart';
import '../home/home_screen.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class BillPaymentScreen extends StatefulWidget {
  const BillPaymentScreen({super.key});

  @override
  State<BillPaymentScreen> createState() => _BillPaymentScreenState();
}

class _BillPaymentScreenState extends State<BillPaymentScreen> {
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
  String selectedTab = "پرداخت قبض";
  final TextEditingController _amountController = TextEditingController();
  String amountInWords = '';


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
                              child: Swiper(
                                layout: SwiperLayout.TINDER,
                                itemWidth: 500,
                                itemHeight: 300,
                                itemBuilder: (context, index) {
                                  return BankCard(account: userAccounts[index],onBookmarkPressed: () => _toggleBookmark(index),);
                                },
                                itemCount: userAccounts.length,
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
