import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../models/card_model.dart';
import '../../widgets/card_filter_tabs.dart';
import '../../widgets/card_item.dart';
import '../home/home_screen.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  String selectedType = AppStrings.cardTypes[0];

  final List<BankCard> allCards = [
    BankCard(
      ownerName: "امیر روحی",
      cardNumber: "6062 5610 1799 4305",
      iban: "IR890750051511242000001050",
      type: "نقدی",
      expiry: "08/12",
      balance: 950000000,
      logoAsset: "assets/images/bank_logo.png",
    ),
    BankCard(
      ownerName: "مینا علمی",
      cardNumber: "6062 5610 1799 4305",
      iban: "IR890750051511242000001050",
      type: "نقدی",
      expiry: "08/12",
      balance: 150000000,
      logoAsset: "assets/images/bank_logo.png",
    ),
  ]; // same as before

  @override
  Widget build(BuildContext context) {
    final filteredCards =
        allCards.where((c) => c.type == selectedType).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              AppStrings.cardScreenTitle,
              style: AppTextStyles.headline,
            ),
          ),
          backgroundColor: AppColors.background,
          foregroundColor: AppColors.primary,
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
          leading: SizedBox(width: 0),
        ),
        body: Container(
          color: AppColors.background,
          padding: const EdgeInsets.symmetric(vertical:  AppSizes.spacing),
          child: Column(
            children: [
              CardTypeTabs(
                types: AppStrings.cardTypes,
                selectedType: selectedType,
                onSelect: (type) => setState(() => selectedType = type),
              ),
              const SizedBox(height: AppSizes.spacing),
              SizedBox(
                height: AppSizes.cardHeight,
                child: Swiper(
                  itemCount: filteredCards.length,
                  layout: SwiperLayout.TINDER,
                  itemWidth: MediaQuery.of(context).size.width * 1.0,
                  itemHeight: AppSizes.cardHeight,
                  onIndexChanged: (index) {
                    // Optional: do something when card changes
                  },
                  itemBuilder: (context, index) {
                    return CardItem(
                      card: filteredCards[index],
                      onBlockPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text(AppStrings.snackbarBlocked)),
                        );
                      },
                      onToggleSecondPassword: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text(AppStrings.snackbarPassword)),
                        );
                      },
                    );
                  },
                ),
              ),

              const SizedBox(height: AppSizes.spacing * 4),
              Column(
                spacing: 20,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(
                            AppSizes.buttonWidth,
                            AppSizes.buttonHeight,
                          ),
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Icon(Icons.lock),
                            Text(AppStrings.secondPassword),
                          ],
                        ),
                      ),

                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          fixedSize: const Size(
                            AppSizes.buttonWidth,
                            AppSizes.buttonHeight,
                          ),
                          side:  BorderSide(color: AppColors.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          mainAxisSize: MainAxisSize.max,
                          children:  [
                            Icon(Icons.block, color: Colors.red),
                            Text(
                              AppStrings.blockCard,
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
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
}
