import 'package:card_swiper/card_swiper.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:mobile_bank/widgets/bank_card.dart';
import '../../core/constants/app_constants.dart';
import '../../models/bank-account.dart';
// import '../../models/card_model.dart';
import '../home/home_screen.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class BuyChargeScreen extends StatefulWidget {
  const BuyChargeScreen({super.key});

  @override
  State<BuyChargeScreen> createState() => BuyChargeScreenState();
}

class BuyChargeScreenState extends State<BuyChargeScreen> {
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

  String selectedTab = "شارژ مستقیم";
  final TextEditingController _amountController = TextEditingController();
  String amountInWords = '';

  final TextEditingController _controller = TextEditingController();
  int? selectedSimIndex;
  final List<Map<String, String>> simOptions = [
    {'name': 'همراه اول', 'image': 'assets/images/hamrah.webp'},
    {'name': 'ایرانسل', 'image': 'assets/images/hamrah.webp'},
    {'name': 'رایتل', 'image': 'assets/images/hamrah.webp'},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("خرید شارژ", style: TextStyle(fontSize: 28)),
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
                                  return BankCard(
                                    account: userAccounts[index],
                                    onBookmarkPressed:
                                        () => _toggleBookmark(index),
                                  );
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,

                                      children: [
                                        SizedBox(width: 4),
                                        Text(
                                          'شارژ مستقیم',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Tab(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 4),
                                        Text(
                                          'رمز شارژ',
                                          style: TextStyle(fontSize: 16),
                                        ),
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
                                  // ➤ Tab 1: شارژ مستقیم
                                  SingleChildScrollView(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // 📱 TextField with prefix/suffix
                                        TextField(
                                          controller: _controller,
                                          decoration: InputDecoration(
                                            labelText: 'شماره همراه',
                                            prefixIcon: Icon(
                                              Icons.edit_outlined,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                Icons
                                                    .perm_contact_calendar_outlined,
                                              ),
                                              onPressed:
                                                  () => _controller.clear(),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                          ),
                                          keyboardType: TextInputType.phone,
                                        ),
                                        SizedBox(height: 16),

                                        // 📶 SIM card selector
                                        Text(
                                          'نوع سیم کارت را انتخاب کنید:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                            simOptions.length,
                                            (index) {
                                              final isSelected =
                                                  selectedSimIndex == index;
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedSimIndex = index;
                                                  });
                                                },
                                                child: Column(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          isSelected
                                                              ? Colors
                                                                  .blue
                                                                  .shade100
                                                              : Colors
                                                                  .grey
                                                                  .shade200,
                                                      radius: 30,
                                                      child: Image.asset(
                                                        simOptions[index]['image']!,
                                                        height: 30,
                                                        width: 30,
                                                      ),
                                                    ),
                                                    SizedBox(height: 6),
                                                    Text(
                                                      simOptions[index]['name']!,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // ➤ Tab 2: رمز شارژ
                                  SingleChildScrollView(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // 📶 SIM card selector
                                        Text(
                                          'نوع سیم کارت را انتخاب کنید:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                            simOptions.length,
                                            (index) {
                                              final isSelected =
                                                  selectedSimIndex == index;
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedSimIndex = index;
                                                  });
                                                },
                                                child: Column(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          isSelected
                                                              ? Colors
                                                                  .blue
                                                                  .shade100
                                                              : Colors
                                                                  .grey
                                                                  .shade200,
                                                      radius: 30,
                                                      child: Image.asset(
                                                        simOptions[index]['image']!,
                                                        height: 30,
                                                        width: 30,
                                                      ),
                                                    ),
                                                    SizedBox(height: 6),
                                                    Text(
                                                      simOptions[index]['name']!,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        // 📱 TextField with prefix/suffix
                                        DropdownSearch<String>(
                                          popupProps: PopupProps.menu(
                                            itemBuilder:
                                                (context, item, isSelected) =>
                                                    Directionality(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      child: ListTile(
                                                        title: Text(
                                                          item,
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                      ),
                                                    ),
                                            showSearchBox: false,
                                            menuProps: MenuProps(
                                              backgroundColor: Colors.white,
                                              elevation: 4,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            searchFieldProps: TextFieldProps(
                                              textAlign: TextAlign.end,
                                              textDirection: TextDirection.ltr,
                                              decoration: InputDecoration(
                                                hintText: "...جستجو",
                                                prefixIcon: Icon(Icons.search),
                                              ),
                                            ),
                                          ),
                                          dropdownDecoratorProps:
                                              DropDownDecoratorProps(
                                                dropdownSearchDecoration:
                                                    InputDecoration(
                                                      labelText: "مبلغ شارژ",
                                                      labelStyle: TextStyle(
                                                        fontSize: 21,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                      prefixIcon: Icon(
                                                        Icons.edit,
                                                      ),
                                                      suffixIcon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              50,
                                                            ),
                                                      ),
                                                    ),
                                              ),

                                          onChanged: (value) {
                                            print("Selected: $value");
                                          },
                                          items: [
                                            "10,000 تومان",
                                            "20,000 تومان",
                                            "50,000 تومان",
                                            "70,000 تومان",
                                          ],
                                          selectedItem: "",
                                        ),
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
