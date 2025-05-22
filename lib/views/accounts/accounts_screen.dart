import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/text_mask.dart';
import '../../models/bank-account.dart';
import '../../widgets/bank_card.dart';
import '../../widgets/custom_app_bar.dart';
import '../home/home_screen.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  String selectedTab = "سپرده منفرد";
  int selectedIndex = 1;
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
  // final List<BankAccount> accounts = [
  //   BankAccount(
  //     ownerName: "مینا علمی",
  //     accountNumber: "051511242000000150",
  //     iban: "IR890750051511242000000150",
  //     type: "سپرده قرض الحسنه",
  //     balance: 150000000,
  //     logoAsset: "assets/images/melal_logo.png",
  //   ),
  //   BankAccount(
  //     ownerName: "علی رضایی",
  //     accountNumber: "051511242000000151",
  //     iban: "IR890750051511242000000151",
  //     type: "سپرده کوتاه مدت",
  //     balance: 85000000,
  //     logoAsset: "assets/images/melal_logo.png",
  //   ),
  //   BankAccount(
  //     ownerName: "فاطمه کریمی",
  //     accountNumber: "051511242000000152",
  //     iban: "IR890750051511242000000152",
  //     type: "سپرده بلند مدت",
  //     balance: 200000000,
  //     logoAsset: "assets/images/melal_logo.png",
  //   ),
  // ];

  @override
  void initState() {
    super.initState();

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
        balance: 875000000000,
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
        appBar: CustomAppBar(
          title: "فهرست سپرده",
          backgroundColor:const Color(0xFFF5F5F5),
          foregroundColor: AppColors.primary,
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = "سپرده منفرد";
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                selectedTab == "سپرده منفرد"
                                    ? AppColors.primary
                                    : Colors.transparent,
                            border: Border.all(color: AppColors.primary),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                          alignment: Alignment.center,
                          child: Text(
                            "سپرده منفرد",
                            style: TextStyle(
                              color:
                                  selectedTab == "سپرده منفرد"
                                      ? Colors.white
                                      : AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = "سپرده مشترک";
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                selectedTab == "سپرده مشترک"
                                    ? AppColors.primary
                                    : Colors.transparent,
                            border: Border.all(color: AppColors.primary),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                          alignment: Alignment.center,
                          child: Text(
                            "سپرده مشترک",
                            style: TextStyle(
                              color:
                                  selectedTab == "سپرده مشترک"
                                      ? Colors.white
                                      : AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 250,
                child: Swiper(
                  index: initialBookmarkedIndex, //  start from bookmarked
                  itemCount: userAccounts.length,
                  itemWidth: 500,
                  itemHeight: 300,
                  layout: SwiperLayout.TINDER,
                  onIndexChanged: (index) {
                    setState(() {
                      selectedIndex = index; // 👈 This updates the details
                    });
                  },
                  itemBuilder: (context, index) {
                    return BankCard(
                      account: userAccounts[index],
                      onBookmarkPressed: () => _toggleBookmark(index), //  here
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              buildAccountDetails(userAccounts[selectedIndex]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAccountDetails(BankAccount account) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "جزئیات حساب",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            DetailRow(label: "نوع سپرده", value: account.type),
            const DetailRow(label: "نوع مسدودی", value: "بخشی"),
            DetailRow(
              label: "مبلغ مسدودی",
              value: formatWithCommas(account.balance.toString()),
            ),
            const DetailRow(label: "تاریخ افتتاح", value: "1401/08/09"),
            const DetailRow(label: "تاریخ سود", value: "1401/08/09"),
          ],
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: AppColors.primary),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
