import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';

import '../../models/bank-account.dart';
import '../bank_card.dart';

class AccountSwiper extends StatelessWidget {
  final List<BankAccount> accounts;
  final int initialIndex;
  final Function(int) onBookmarkTapped;

  const AccountSwiper({
    super.key,
    required this.accounts,
    required this.initialIndex,
    required this.onBookmarkTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Swiper(
        index: initialIndex,
        layout: SwiperLayout.TINDER,
        itemWidth: 500,
        itemHeight: 300,
        itemBuilder: (BuildContext context, int index) {
          return BankCard(
            account: accounts[index],
            onBookmarkPressed: () => onBookmarkTapped(index),
          );
        },
        itemCount: accounts.length,
      ),
    );
  }
}
