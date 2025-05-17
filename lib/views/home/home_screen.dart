import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mobile_bank/views/accounts/accounts_screen.dart';
import 'package:mobile_bank/views/anifam/anifam_screen.dart';
import 'package:mobile_bank/views/services/services_screen.dart';
import 'package:mobile_bank/widgets/bottom_bar.dart';
import 'package:mobile_bank/widgets/transfer_section.dart';
import '../../core/constants/app_constants.dart';
import '../../models/bank-account.dart';
import '../../widgets/bank_card.dart';
import '../../widgets/loan_banner.dart';
import '../../widgets/quick_action.dart';
import '../cards/cards_screen.dart';
import '../profile/profile_screen.dart';

final List<BankAccount> userAccounts = [
  BankAccount(
    ownerName: "مینا علمی",
    accountNumber: "051511242000000150",
    iban: "IR890750051511242000000150",
    type: "سپرده قرض الحسنه",
    balance: 150000000,
    logoAsset: 'assets/images/melal_icon.png',
  ),
  BankAccount(
    ownerName: "علی احمدی",
    accountNumber: "051511242000000151",
    iban: "IR230750051511242000000151",
    type: "سپرده کوتاه مدت",
    balance: 87500000,
    logoAsset: 'assets/images/melal_icon.png',
  ),
  // More accounts...
];


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = -1; // -1 means home
  late Widget screen;
  String _appBarTitle = '';
  ThemeData _currentTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primary,
    fontFamily: "IRANSans",
  );
  Color? _currentAppbar = Color.fromRGBO(29, 75, 126, 1);

  final Map<int, ThemeData> _themesByIndex = {
    -1: ThemeData(
      scaffoldBackgroundColor: AppColors.primary,
      fontFamily: "IRANSans",
    ), // Home
    0: ThemeData(
      scaffoldBackgroundColor: Color.fromRGBO(246, 248, 250, 1),
      fontFamily: "IRANSans",
    ), // Profile
    1: ThemeData(
      scaffoldBackgroundColor: const Color(0xF5F5F5F5),
      fontFamily: "IRANSans",
    ), // Services
    2: ThemeData(
      scaffoldBackgroundColor: const Color(0xF5F5F5F5),
      fontFamily: "IRANSans",
    ), // Card
    3: ThemeData(
      scaffoldBackgroundColor: const Color(0xF5F5F5F5),
      fontFamily: "IRANSans",
    ), // Account
  };
  final Map<int, Color> _appbarByIndex = {
    -1: Color.fromRGBO(29, 75, 126, 1), // Home
    0: Color.fromRGBO(29, 75, 126, 1), // Profile
    1: Color.fromRGBO(245, 245, 245, 1), // Services
    2: Color.fromRGBO(245, 245, 245, 1), // Cards
    3: Color.fromRGBO(245, 245, 245, 1), // Accounts
  };





  @override
  void initState() {
    super.initState();
    screen = const HomeContent();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _currentTheme = _themesByIndex[index] ?? ThemeData.light();
      _currentAppbar = _appbarByIndex[index];
      switch (index) {
        case 0:
          screen = const ProfileScreen();
          _appBarTitle = 'پروفایل';
          break;
        case 1:
          screen = const ServicesScreen();
          _appBarTitle = 'خدمات';
          break;
        case 2:
          screen = const CardsScreen();
          _appBarTitle = 'کارت';
          break;
        case 3:
          screen = const AccountsScreen();
          _appBarTitle = 'سپرده';
          break;
        default:
          screen = const HomeContent();
          _appBarTitle = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _currentTheme,
      home: Scaffold(
        extendBody: true,
        appBar:
            _selectedIndex == -1
                ? AppBar(
                  title: Center(
                    child: Text(_appBarTitle, style: TextStyle(fontSize: 28)),
                  ),
                  backgroundColor: _currentAppbar,
                  foregroundColor: AppColors.white,
                  automaticallyImplyLeading: true,
                  actions: [
                    _selectedIndex == -1
                        ? IconButton(
                          icon: const Icon(
                            Icons.menu,
                            size: 40,
                            color: AppColors.white,
                          ),
                          onPressed: () {},
                        )
                        : Container(
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.white,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward,
                              size: 30,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              // Navigator.pop(context);
                            },
                          ),
                        ),
                  ],
                  leading:
                      _selectedIndex != -1
                          ? IconButton(
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Icon(Icons.home, size: 36),
                            ),
                            tooltip: 'خانه',
                            onPressed: () {
                              setState(() {
                                _selectedIndex = -1;
                                screen = const HomeContent();
                                _appBarTitle = '';
                                _currentTheme = _themesByIndex[-1]!;
                              });
                            },
                          )
                          : SizedBox(width: 50),
                )
                : null,
        body: screen,
        floatingActionButton: SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnifamScreen()),
              );
            },
            backgroundColor: Colors.deepOrangeAccent,
            foregroundColor: AppColors.white,
            child: const Icon(Icons.electric_bolt, size: 40),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar:
        // Padding(
        // padding: const EdgeInsets.symmetric(horizontal: 10),
        // child:
        BottomBar(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
      ),
    );
    // );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int selectedQuickActionIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// ❄️ Fixed Content (background)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 📇 Cards
            SizedBox(
              height: 250,
              child: Swiper(
                layout: SwiperLayout.TINDER,
                itemWidth: 500,
                itemHeight: 300,
                itemBuilder: (BuildContext context, int index) {
                  return BankCard(account: userAccounts[index]);
                },
                itemCount: userAccounts.length,
              ),
            ),

            const SizedBox(height: 20),

            /// ⚡ Quick Actions
            QuickActions(
              selectedIndex: selectedQuickActionIndex,
              onActionSelected: (index) {
                setState(() {
                  selectedQuickActionIndex = index;
                });
              },
            ),

            const SizedBox(height: 0),

            /// 📢 Loan Banner
            loanBanner,
          ],
        ),

        /// 🧲 Draggable Scrollable Panel (overlay)
        DraggableScrollableSheet(
          initialChildSize: 0.40,
          minChildSize: 0.40,
          maxChildSize: 0.70,
          builder: (context, scrollController) {
            return Container(
              margin:const EdgeInsets.all(16.0) ,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: TransferSection(),
              ),
            );
          },
        ),
      ],
    );
  }
}
