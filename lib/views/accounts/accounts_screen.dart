import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/text_mask.dart';
import '../../models/bank-account.dart';
import '../../widgets/bank_card.dart';
import '../home/home_screen.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  String selectedTab = "سپرده منفرد";
  int selectedIndex = 0;

  final List<BankAccount> accounts = [
    BankAccount(
      ownerName: "مینا علمی",
      accountNumber: "051511242000000150",
      iban: "IR890750051511242000000150",
      type: "سپرده قرض الحسنه",
      balance: 150000000,
      logoAsset: "assets/images/melal_logo.png",
    ),
    BankAccount(
      ownerName: "علی رضایی",
      accountNumber: "051511242000000151",
      iban: "IR890750051511242000000151",
      type: "سپرده کوتاه مدت",
      balance: 85000000,
      logoAsset: "assets/images/melal_logo.png",
    ),
    BankAccount(
      ownerName: "فاطمه کریمی",
      accountNumber: "051511242000000152",
      iban: "IR890750051511242000000152",
      type: "سپرده بلند مدت",
      balance: 200000000,
      logoAsset: "assets/images/melal_logo.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("فهرست سپرده", style: TextStyle(fontSize: 28)),
          ),
          backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
          foregroundColor: AppColors.primary,
          elevation: 0,
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
          leading: SizedBox(width: 0),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ToggleButtons(
                isSelected: [
                  selectedTab == "سپرده منفرد",
                  selectedTab == "سپرده مشترک",
                ],
                onPressed: (index) {
                  setState(() {
                    selectedTab = index == 0 ? "سپرده منفرد" : "سپرده مشترک";
                  });
                },
                borderRadius: BorderRadius.circular(50),
                selectedColor: AppColors.white,
                fillColor: AppColors.primary,
                color: Colors.black,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("سپرده منفرد"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("سپرده مشترک"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 250,
                child: Swiper(
                  itemCount: accounts.length,
                  itemWidth: 500,
                  itemHeight: 300,
                  layout: SwiperLayout.TINDER,
                  onIndexChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return BankCard(account: accounts[index]);
                  },
                ),
              ),
              const SizedBox(height: 20),
              buildAccountDetails(accounts[selectedIndex]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAccountDetails(BankAccount account) {
    return Container(
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
            DetailRow(label: "مبلغ مسدودی", value: formatWithCommas(account.balance.toString())),
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
          Text(value, style: const TextStyle(fontSize: 16)),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
