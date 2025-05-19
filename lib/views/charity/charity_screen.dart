import 'package:card_swiper/card_swiper.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:mobile_bank/core/constants/app_constants.dart';

import '../../core/utils/number_to_word.dart';
import '../../models/bank-account.dart';
import '../../widgets/bank_card.dart';
import '../../widgets/price_input_field.dart';
import '../home/home_screen.dart';
import '../transfer/widgets/transfer_continue_button.dart';

class CharityScreen extends StatefulWidget {
  CharityScreen({super.key});


  @override
  State<CharityScreen> createState() => _CharityScreenState();
}

class _CharityScreenState extends State<CharityScreen> {
  final TextEditingController amountController = TextEditingController();

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
    amountController.addListener(() => setState(() {}));

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
          title: Center(
            child: Text("نیکوکاری", style: TextStyle(fontSize: 28)),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
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
                            child: Swiper(
                              index:
                                  initialBookmarkedIndex, //  start from bookmarked
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

                          const SizedBox(height: 40),

                          // 📝 Description input
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: Column(
                              children: [
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: DropdownSearch<String>(
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                      menuProps: MenuProps(
                                        backgroundColor: Colors.white,
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                      searchFieldProps: TextFieldProps(
                                        textAlign: TextAlign.end,
                                        decoration: InputDecoration(
                                          hintText: "جستجو...",
                                          prefixIcon: Icon(Icons.search),
                                        ),
                                      ),
                                    ),
                                    dropdownDecoratorProps: DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                        labelText: "موسسه خیریه",
                                        labelStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        prefixIcon: Icon(Icons.edit),
                                        suffixIcon: Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                        ),
                                        suffixIconColor: AppColors.primary,
                                        focusColor: AppColors.primary,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                        ),
                                      ),
                                    ),
                                    items: [
                                      'بدهی',
                                      'آیتم B',
                                      'آیتم C',
                                      'آیتم D',
                                    ],
                                    onChanged: (value) {
                                      print("Selected: $value");
                                    },
                                  ),
                                ),
                                const SizedBox(height: 40),
                                // 💰 Amount input
                                PriceInputField(controller: amountController),
                                NumberToWordsText(
                                  number: amountController.text.isEmpty
                                      ? null
                                      : int.tryParse(amountController.text.replaceAll(',', '')),
                                  textStyle: TextStyle(fontSize: 13, color: Colors.green.shade800, fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // ✅ Submit button
                const Positioned(
                  bottom: 30,
                  right: 0,
                  left: 0,
                  child: TransferContinueButton(),
                ),              ],
            ),
          ],
        ),
      ),
    );
  }
}
