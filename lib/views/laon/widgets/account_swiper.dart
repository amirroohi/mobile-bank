import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/bank-account.dart';
import '../../../widgets/bank_card.dart';


class AccountSwiper extends StatelessWidget {
  final List<BankAccount> accounts;
  final int initialIndex;
  final void Function(int) onBookmark;

  const AccountSwiper({
    super.key,
    required this.accounts,
    required this.initialIndex,
    required this.onBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Swiper(
        index: initialIndex,
        layout: SwiperLayout.TINDER,
        itemWidth: 500,
        itemHeight: 300,
        itemBuilder: (context, index) {
          return BankCard(
            account: accounts[index],
            onBookmarkPressed: () => onBookmark(index),
          );
        },
        itemCount: accounts.length,
      ),
    );
  }
}
