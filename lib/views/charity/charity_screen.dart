import 'package:card_swiper/card_swiper.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:mobile_bank/core/constants/app_constants.dart';
import 'package:mobile_bank/views/transfer/transfer_type_screen.dart';

import '../../models/bank-account.dart';
import '../../widgets/account_item.dart';
import '../../widgets/bank_card.dart';
import '../home/home_screen.dart';

class CharityScreen extends StatefulWidget {
  const CharityScreen({super.key});

  @override
  State<CharityScreen> createState() => _CharityScreenState();
}


class _CharityScreenState extends State<CharityScreen> {
  final List<BankAccount> userAccounts = [
    BankAccount(
      ownerName: "مینا علمی",
      accountNumber: "051511242000000150",
      iban: "IR890750051511242000000150",
      type: "سپرده قرض الحسنه",
      balance: 150000000,
      logoAsset: "assets/images/bank_logo.png",
    ),
    BankAccount(
      ownerName: "علی رضایی",
      accountNumber: "0215458789500000012",
      iban: "IR1207500215458789500000012",
      type: "سپرده جاری",
      balance: 92000000,
      logoAsset: "assets/images/bank_logo.png",
    ),
  ];
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
                icon: const Icon(Icons.home,size: 32,),
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
                      height: 480,
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
                            child: Swiper(
                              layout: SwiperLayout.TINDER,
                              itemWidth: 500,
                              itemHeight: 300,
                              itemBuilder: (context, index) {
                                return BankCard(account: userAccounts[index]);
                              },
                              itemCount: userAccounts.length,
                            ),
                          ),

                          const SizedBox(height: 40),

                          // 📝 Description input
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: DropdownSearch<String>(
                              popupProps: PopupProps.menu(
                                showSearchBox: true,
                                menuProps: MenuProps(
                                  backgroundColor: Colors.white,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
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
                                  suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
                                  suffixIconColor:  Colors.black,
                                  focusColor: AppColors.primary,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                              items: ['بدهی', 'آیتم B', 'آیتم C', 'آیتم D'],
                              onChanged: (value) {
                                print("Selected: $value");
                              },
                            ),
                          ),
                          const SizedBox(height: 40),
                          // 💰 Amount input
                          TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              labelText: "مبلغ",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // ✅ Submit button
                Positioned(
                  bottom: 30,
                  right: 0,
                  left: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TransferTypeScreen(),
                          ),
                        );
                        // TODO: Handle transfer logic or navigation
                      },
                      child: const Text(
                        "ادامه",
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
