import 'package:flutter/material.dart';
import 'package:mobile_bank/widgets/slide_navigation.dart';

import '../core/constants/app_constants.dart';
import '../views/anifam/anifam_screen.dart';

class FloatingActionButtonCustom extends StatefulWidget {
  const FloatingActionButtonCustom({super.key});

  @override
  State<FloatingActionButtonCustom> createState() =>
      _FloatingActionButtonCustomState();
}

class _FloatingActionButtonCustomState
    extends State<FloatingActionButtonCustom> {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  // int _selectedIndex = -1; // -1 means home
  late Widget screen;
  @override
  void initState() {
    super.initState();

    // _controller = AnimationController(
    //   vsync: ,
    //   duration: const Duration(milliseconds: 700),
    // );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.3), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat(); // 🔁 Start infinite loop
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, slideFromRight(const AnifamScreen()));
        },

        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: const Icon(Icons.electric_bolt, size: 40),
        ),
      ),
    );
  }
}
