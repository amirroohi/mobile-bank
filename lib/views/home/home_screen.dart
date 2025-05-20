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
import '../../widgets/slide_navigation.dart';
import '../cards/cards_screen.dart';
import '../setting/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  int _selectedIndex = -1; // -1 means home
  late Widget screen;

  @override
  void initState() {
    super.initState();
    screen = const HomeContent();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.3), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat(); // 🔁 Start infinite loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          screen = const ProfileScreen();
          break;
        case 1:
          screen = const ServicesScreen();
          break;
        case 2:
          screen = const CardsScreen();
          break;
        case 3:
          screen = const AccountsScreen();
          break;
        default:
          screen = const HomeContent();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeByIndex = {
      -1: ThemeData(
        scaffoldBackgroundColor: AppColors.primary,
        fontFamily: "IRANSans",
      ),
      0: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(246, 248, 250, 1),
        fontFamily: "IRANSans",
      ),
      1: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: "IRANSans",
      ),
      2: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: "IRANSans",
      ),
      3: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: "IRANSans",
      ),
    };

    final appbarByIndex = {
      -1: const Color.fromRGBO(29, 75, 126, 1),
      0: const Color.fromRGBO(29, 75, 126, 1),
      1: const Color(0xFFF5F5F5),
      2: const Color(0xFFF5F5F5),
      3: const Color(0xFFF5F5F5),
    };

    final theme = themeByIndex[_selectedIndex] ?? ThemeData.light();
    final appBarColor = appbarByIndex[_selectedIndex] ?? Color.fromRGBO(29, 75, 126, 1);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Scaffold(
        extendBody: true,
        appBar: _selectedIndex == -1
            ? AppBar(
          backgroundColor: appBarColor,
          foregroundColor: AppColors.white,
          leading: IconButton(
            icon: const Icon(Icons.home, size: 36),
            tooltip: 'خانه',
            onPressed: () {
              setState(() {
                _selectedIndex = -1;
                screen = const HomeContent();
              });
            },
          ),
        )
            : null,
        body: screen,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, slideFromRight(const AnifamScreen()));
          },
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: const Icon(Icons.electric_bolt, size: 40),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

// =================== HOME CONTENT ===================

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
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

    userAccounts = [
      BankAccount(
        ownerName: "مینا علمی",
        accountNumber: "051511242000000150",
        iban: "IR890750051511242000000150",
        type: "سپرده قرض الحسنه",
        balance: 1500000000000,
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
        isBookmarked: true,
      ),
      BankAccount(
        ownerName: "خودم",
        accountNumber: "051511242000000151",
        iban: "IR230750051511242000000151",
        type: "سپرده بلند مدت",
        balance: 87500000,
        logoAsset: 'assets/images/melal_icon.png',
        isBookmarked: false,
      ),
    ];

    initialBookmarkedIndex = userAccounts.indexWhere((a) => a.isBookmarked);
    if (initialBookmarkedIndex == -1) initialBookmarkedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// 🧾 Main content
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 💳 Account cards
            SizedBox(
              height: 250,
              child: Swiper(
                index: initialBookmarkedIndex,
                layout: SwiperLayout.TINDER,
                itemWidth: 500,
                itemHeight: 300,
                itemBuilder: (BuildContext context, int index) {
                  return BankCard(
                    account: userAccounts[index],
                    onBookmarkPressed: () => _toggleBookmark(index),
                  );
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

        /// 🧲 Draggable Panel
        DraggableScrollableSheet(
          initialChildSize: 0.40,
          minChildSize: 0.40,
          maxChildSize: 0.70,
          builder: (context, scrollController) {
            return Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary,
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child:  TransferSection(),
              ),
            );
          },
        ),
      ],
    );
  }
}
