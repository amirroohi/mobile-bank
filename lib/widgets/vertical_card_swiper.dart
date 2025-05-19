import 'package:flutter/material.dart';
import '../../models/bank-account.dart';

class VerticalStackSwiper extends StatefulWidget {
  final List<BankAccount> accounts;

  const VerticalStackSwiper({super.key, required this.accounts});

  @override
  State<VerticalStackSwiper> createState() => _VerticalStackSwiperState();
}

class _VerticalStackSwiperState extends State<VerticalStackSwiper> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.6,
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        controller: _controller,
        scrollDirection: Axis.vertical,
        itemCount: widget.accounts.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double page = _controller.hasClients
                  ? _controller.page ?? _controller.initialPage.toDouble()
                  : _controller.initialPage.toDouble();

              final diff = index - page;
              final scale = (1 - diff.abs() * 0.45).clamp(0.85, 1.0);
              final opacity = (1 - diff.abs()).clamp(1.0, 1.0);
              final offsetY = diff * -115;

              return Transform.translate(
                offset: Offset(0, offsetY),
                child: Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: opacity,
                    child: child,
                  ),
                ),
              );
            },
            // child: BankCard(account: widget.accounts[index]),
          );
        },
      ),
    );
  }
}
