import 'package:flutter/material.dart';
import 'package:mobile_bank/core/constants/app_constants.dart';
import 'package:mobile_bank/views/transfer/transfer_form_screen.dart';
import '../../widgets/card_filter_tabs.dart';
import '../home/home_screen.dart';

class AnifamScreen extends StatefulWidget {
  const AnifamScreen({super.key});

  @override
  State<AnifamScreen> createState() => _AnifamScreenState();
}

class _AnifamScreenState extends State<AnifamScreen>
    with SingleTickerProviderStateMixin {
  String selectedFilter = 'کارت به کارت'; // default tab
  final List<String> filters = ['کارت به کارت', 'انتقال وجه', 'قبض', 'شارژ'];

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

  final TextEditingController _searchController = TextEditingController();
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredItems =
        allItems.where((item) {
          final matchesType = item['type'] == selectedFilter;
          final matchesSearch =
              item['name'].toString().toLowerCase().contains(
                searchText.toLowerCase(),
              ) ||
              item['cardNumber'].toString().contains(searchText) ||
              item['amount'].toString().contains(searchText);
          return matchesType && matchesSearch;
        }).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TransferFormSection()),
              );
            },
            backgroundColor: Colors.deepOrangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            foregroundColor: Colors.white,
            child: Icon(Icons.add),
          ),
        ),
        appBar: AppBar(
          title: const Center(
            child: Text("آنی فام", style: TextStyle(fontSize: 28)),
          ),
          backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
          foregroundColor: const Color(0xFF1D4B7E),
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
        body: Container(
          color: const Color.fromRGBO(245, 245, 245, 1),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Search
                  TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        searchText = value.trim();
                      });
                    },
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: "جستجو",
                      suffixIcon: Icon(Icons.search_outlined),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          width: 5,
                          color: Color(0xFFF3F6FA),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Filter Tabs
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CardTypeTabs(
                      types: filters,
                      selectedType: selectedFilter,
                      onSelect: (type) {
                        setState(() {
                          selectedFilter = type;
                        });
                      },
                    ),
                  ),

                  // ListView
                  filteredItems.isNotEmpty
                      ? Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 20),
                          itemCount: filteredItems.length,
                          itemBuilder: (context, index) {
                            final item = filteredItems[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 16,
                                  ), // Reduce padding
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage(item['logo']),
                                    backgroundColor: Colors.grey.shade200,
                                    radius: 24,
                                  ),
                                  title: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .center, // Center vertically
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['name'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(item['cardNumber']),
                                      Text("ریال${item['amount']}"),
                                    ],
                                  ),
                                  trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: Colors.white,
                                      shape: StadiumBorder(),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "تکرار تراکنش",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                      : Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          "تراکنشی یافت نشد...",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
