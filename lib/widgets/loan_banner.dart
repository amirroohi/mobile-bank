import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

Widget loanBanner = Container(
  margin: const EdgeInsets.all(16),
  height: 110,
  child: ClipRRect(
    borderRadius: BorderRadius.circular(25),
    child: Swiper(
      itemCount: _loanBannerImages.length,
      autoplay: true,
      autoplayDelay: 5000,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          _loanBannerImages[index],
          fit: BoxFit.cover,
        );
      },
    ),
  ),
);

final List<String> _loanBannerImages = [
  'assets/images/banner.png',
  'assets/images/banner.png',
  'assets/images/banner.png',
];
