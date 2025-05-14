import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../models/bank-account.dart';
import '../../widgets/account_item.dart';
import '../home/home_screen.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  String selectedTab = "سپرده منفرد";

  final BankAccount account = BankAccount(
    ownerName: "مینا علمی",
    accountNumber: "051511242000000150",
    iban: "IR890750051511242000000150",
    type: "سپرده قرض الحسنه",
    balance: 150000000,
    logoAsset: "assets/images/bank_logo.png",
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: const Text("فهرست سپرده", style: TextStyle(fontSize: 28)),
          ),
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
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
                selectedColor: Colors.white,
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
                height: 240,
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.9),
                  itemCount:
                      3, // you can replace with `accounts.length` if you have a list
                  itemBuilder: (context, index) {
                    return AccountItem(account: account);
                  },
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  side: const BorderSide(color: Colors.black),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text(
                  "صورت حساب",
                  style: TextStyle(fontSize: 18, color: Color(0xFF1D4B7E)),
                ),
              ),
              const SizedBox(height: 20),
              buildAccountDetails(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 3,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "پروفایل"),
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: "خدمات"),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: "کارت",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance),
              label: "سپرده",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAccountCard(BankAccount account) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: AppColors.primary,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(account.iban, style: const TextStyle(color: Colors.white)),
            Text(
              account.accountNumber,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              "6062 5610 1799 4305",
              style: const TextStyle(color: Colors.white),
            ), // Dummy card number
            Text(account.type, style: const TextStyle(color: Colors.white)),
            Text(
              account.ownerName,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.person, color: Colors.white),
                Icon(Icons.link, color: Colors.white),
                Icon(Icons.insert_drive_file, color: Colors.white),
                Icon(Icons.qr_code, color: Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "${account.balance.toStringAsFixed(0)} ریال",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAccountDetails() {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: Colors.white,
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
                  color: Color(0xFF1D4B7E),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const DetailRow(
              label: "نوع سپرده",
              value: "کوتاه مدت ماه شمار - حقیقی",
            ),
            const DetailRow(label: "نوع مسدودی", value: "بخشی"),
            const DetailRow(label: "مبلغ مسدودی", value: "500,000 ریال"),
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
