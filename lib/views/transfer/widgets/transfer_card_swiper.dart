import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../../models/bank-account.dart';
import '../../../widgets/bank_card.dart';

class TransferCardSwiper extends StatelessWidget {
  final List<BankAccount> accounts;
  final int initialIndex;
  final void Function(int) onBookmark;

  const TransferCardSwiper({
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
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return BankCard(
            account: accounts[index],
            onBookmarkPressed: () => onBookmark(index),
          );
        },
      ),
    );
  }
}
