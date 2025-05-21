import 'package:flutter/material.dart';
import 'package:mobile_bank/views/accounts/accounts_screen.dart';
import 'package:mobile_bank/views/anifam/anifam_screen.dart';
import 'package:mobile_bank/views/services/services_screen.dart';
import 'package:mobile_bank/widgets/bottom_bar.dart';
import '../../core/constants/app_constants.dart';
import '../../widgets/home/home_content.dart';
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
            icon: const Icon(Icons.home, size: 0),
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
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
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

