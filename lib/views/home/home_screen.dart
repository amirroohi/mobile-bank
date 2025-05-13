import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mobile_bank/views/accounts/accounts_screen.dart';
import 'package:mobile_bank/views/anifam/anifam_screen.dart';
import 'package:mobile_bank/views/services/services_screen.dart';
import 'package:mobile_bank/views/transfer/transfer_form_screen.dart';
import 'package:mobile_bank/widgets/bottom_bar.dart';
import 'package:mobile_bank/widgets/transfer_section.dart';
import '../../widgets/bank_card.dart';
import '../../widgets/loan_banner.dart';
import '../../widgets/quick_action.dart';
import '../cards/cards_screen.dart';
import '../profile/profile_screen.dart';

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
    scaffoldBackgroundColor: const Color(0xFF1D4B7E),
    fontFamily: "IRANSans",
  );
  Color? _currentAppbar = Color.fromRGBO(29, 75, 126, 1);

  final Map<int, ThemeData> _themesByIndex = {
    -1: ThemeData(
      scaffoldBackgroundColor: const Color(0xFF1D4B7E),
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
                  foregroundColor: Colors.white,
                  automaticallyImplyLeading: true,
                  actions: [
                    _selectedIndex == -1
                        ? IconButton(
                          icon: const Icon(
                            Icons.menu,
                            size: 40,
                            color: Colors.white70,
                          ),
                          onPressed: () {},
                        )
                        : Container(
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
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
                MaterialPageRoute(builder: (context) => TransferFormSection()),
              );
            },
            backgroundColor: Colors.deepOrangeAccent,
            foregroundColor: Colors.white,
            child: const Icon(Icons.qr_code_scanner, size: 40),
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
  int selectedQuickActionIndex = 3;

  Widget getTransferSection() {
    switch (selectedQuickActionIndex) {
      case 0:
        return _buildTransferBox("نمایش تسهیلات فعال");
      case 1:
        return _buildTransferBox("شارژ سیم‌کارت");
      case 2:
        return _buildTransferBox("پرداخت قبض");
      case 3:
        return TransferSection();
      default:
        return Container(); // or an empty prompt
    }
  }

  Widget _buildTransferBox(String text) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),

        // 📇 Bank cards (fixed)
        SizedBox(
          height: 250,
          child: Swiper(
            layout: SwiperLayout.TINDER,
            itemWidth: 500,
            itemHeight: 300,
            itemBuilder: (BuildContext context, int index) {
              return BankCard(
                iban: "IR890750051511242000000150",
                accountNumber: "051511242000000150",
                cardNumber: "6062 5610 1799 4305",
                accountType: "سپرده قرض الحسنه",
                owner: "مینا علمی",
                balance: "150,000,000",
              );
            },
            itemCount: 3,
          ),
        ),
        // child: SizedBox(
        //   height: 240,
        //   child: PageView.builder(
        //     controller: PageController(viewportFraction: 0.9),
        //     itemCount: 3,
        //     itemBuilder: (context, index) {
        //       return BankCard(
        //         iban: "IR890750051511242000000150",
        //         accountNumber: "051511242000000150",
        //         cardNumber: "6062 5610 1799 4305",
        //         accountType: "سپرده قرض الحسنه",
        //         owner: "مینا علمی",
        //         balance: "150,000,000",
        //       );
        //     },
        //   ),
        // ),
        const SizedBox(height: 20),

        // 🪄 Controlled scrollable section
        SizedBox(
          height:
              480, // Set based on the combined height of getTransferSection + desired scroll space
          child: Stack(
            children: [
              // ⚡ Quick Actions (fixed)
              Positioned(
                top: 12,
                left: 0,
                right: 0,
                child: QuickActions(
                  selectedIndex: selectedQuickActionIndex,
                  onActionSelected: (index) {
                    setState(() {
                      selectedQuickActionIndex = index;
                    });
                  },
                ),
              ),
              Positioned(
                top: 90, // Space that getTransferSection will scroll into
                left: 0,
                right: 0,
                child: loanBanner, // ⬇️ This stays in place
              ),
              Positioned.fill(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) => true,
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.only(top: 200),
                    child: Column(
                      children: [
                        // ⬆️ This scrolls over loanBanner
                        getTransferSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
