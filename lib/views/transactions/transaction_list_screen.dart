import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../models/bank-account.dart';
import '../../widgets/account_item.dart';
import '../home/home_screen.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});
  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> transactions = [
    {
      'name': 'امیر محمد غفاری',
      'cardNumber': '6037997551234567',
      'amount': '850,000',
      'logo': 'assets/images/bank_logo.png',
    },
    {
      'name': 'کاربر تست',
      'cardNumber': '6104337891234567',
      'amount': '500,000',
      'logo': 'assets/images/bank_logo.png',
    },
    {
      'name': 'مینا علمی',
      'cardNumber': '5859834561234567',
      'amount': '1,250,000',
      'logo': 'assets/images/bank_logo.png',
    },
  ];

  List<Map<String, dynamic>> filteredItems = [];

  final List<Map<String, dynamic>> allItems = [
    {
      'name': 'امیر محمد غفاری',
      'cardNumber': '6104337485967412',
      'amount': '256,000',
      'type': 'کارت به کارت',
      'logo': 'assets/images/hamrah.webp',
    },
    {
      'name': 'امیر محمد غفاری',
      'cardNumber': '6104337485967412',
      'amount': '256,000',
      'type': 'کارت به کارت',
      'logo': 'assets/images/hamrah.webp',
    },
    {
      'name': 'مینا علمی',
      'cardNumber': '6274121190547059',
      'amount': '256,000',
      'type': 'قبض',
      'logo': 'assets/images/hamrah.webp',
    },
    {
      'name': 'مینا علمی',
      'cardNumber': '6274121190547059',
      'amount': '256,000',
      'type': 'قبض',
      'logo': 'assets/images/hamrah.webp',
    },
    {
      'name': 'نام نام خانوادگی',
      'cardNumber': '6221061252634158',
      'amount': '256,000',
      'type': 'شارژ',
      'logo': 'assets/images/hamrah.webp',
    },
    {
      'name': 'نام نام خانوادگی',
      'cardNumber': '6221061252634158',
      'amount': '256,000',
      'type': 'شارژ',
      'logo': 'assets/images/hamrah.webp',
    },
    {
      'name': 'نام نام خانوادگی',
      'cardNumber': '6221061252634158',
      'amount': '256,000',
      'type': 'شارژ',
      'logo': 'assets/images/hamrah.webp',
    },
    // Add more items...
  ];

  final BankAccount account = BankAccount(
    ownerName: "مینا علمی",
    accountNumber: "051511242000000150",
    iban: "IR890750051511242000000150",
    type: "سپرده قرض الحسنه",
    balance: 150000000,
    logoAsset: "assets/images/bank_logo.png",
  );
  String searchText = '';

  // List<Map<String, dynamic>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(transactions);

    _searchController.addListener(() {
      setState(() {
        String query = _searchController.text;
        filteredItems =
            transactions.where((tx) {
              return tx['name'].contains(query) ||
                  tx['cardNumber'].contains(query) ||
                  tx['amount'].contains(query);
            }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems =
        allItems.where((item) {
          final matchesSearch =
              item['name'].toString().toLowerCase().contains(
                searchText.toLowerCase(),
              ) ||
              item['cardNumber'].toString().contains(searchText) ||
              item['amount'].toString().contains(searchText);
          return matchesSearch;
        }).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("فهرست تراکنش ها", style: TextStyle(fontSize: 28)),
          ),
          backgroundColor: const Color(0xFF1D4B7E),
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
                Container(height: 150, color: const Color(0xFF1D4B7E)),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // TODO: Handle filter or search
                                },
                                icon: const Icon(Icons.filter_alt_outlined),
                                label: const Text("جستجوی پیشرفته"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFEF7F00),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height:
                                350, // or any height that fits well inside your layout
                            child: ListView.separated(
                              itemCount: filteredItems.length,
                              padding: const EdgeInsets.only(top: 20),
                              itemBuilder: (context, index) {
                                final item = filteredItems[index];
                                return Card(
                                  elevation: 0,
                                  color: Colors.white,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 16,
                                    ),
                                    leading: CircleAvatar(
                                      backgroundImage: AssetImage(item['logo']),
                                      backgroundColor: Colors.grey.shade200,
                                      radius: 24,
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['name'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(item['cardNumber']),
                                        Text("ریال ${item['amount']}"),
                                      ],
                                    ),

                                    trailing: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [

                                        Text(
                                          item['type'] ??
                                              "", // Or any other detail like "قبض"
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          item['amount'] ??
                                              "", // Or any other detail like "قبض"
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "جزییات",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (context, index) => const Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    indent: 16,
                                    endIndent: 16,
                                  ),
                            ),
                          ),
                        ],
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
