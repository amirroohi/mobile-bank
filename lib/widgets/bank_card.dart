import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/utils/text_mask.dart';
import '../models/bank-account.dart';

class BankCard extends StatefulWidget {
  final BankAccount account;
  // you can send assetsImage to this

  final VoidCallback onBookmarkPressed;

  const BankCard({
    super.key,
    required this.account,
    required this.onBookmarkPressed,
  });

  @override
  State<BankCard> createState() => _BankCardState();
}

class _BankCardState extends State<BankCard> {
  bool isBalanceVisible = false; // Add this in your state
  bool isBookmarked = false; // state variable

  // popup fnc
  final GlobalKey _menuKey = GlobalKey();
  void _showPopupMenu() {
    final RenderBox renderBox =
        _menuKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + size.height,
        offset.dx + size.width,
        0,
      ),
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      items: [
        PopupMenuItem(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Icon(
                  Icons.account_balance_wallet_outlined,
                  color: AppColors.secondary,
                ),
                SizedBox(width: 8),
                Text(
                  'ویرایش',
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Icon(Icons.edit, color: AppColors.secondary),
                SizedBox(width: 8),
                Text(
                  'ویرایش',
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Icon(Icons.mobile_friendly, color: AppColors.secondary),
                SizedBox(width: 8),
                Text(
                  'ویرایش',
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Icon(Icons.mobile_friendly, color: AppColors.secondary),
                SizedBox(width: 8),
                Text(
                  'ویرایش',
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Icon(Icons.mobile_friendly, color: AppColors.secondary),
                SizedBox(width: 8),
                Text(
                  'ویرایش',
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Icon(Icons.mobile_friendly, color: AppColors.secondary),
                SizedBox(width: 8),
                Text(
                  'ویرایش',
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            Color(0xFF205FA1), // rich deep blue
            Color(0xFF2E75B6), // your existing nice blue
            Color(0xFF6FB1FC), // energetic soft blue
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // more_vert IconButton with exact positioning
                      IconButton(
                        iconSize: 30,
                        key: _menuKey,
                        icon: Icon(Icons.more_vert, color: AppColors.white),
                        onPressed: _showPopupMenu,
                      ),

                      //  Bookmark toggle
                      IconButton(
                        iconSize: 30,
                        icon: Icon(
                          widget.account.isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border_outlined,
                          color:
                              widget.account.isBookmarked
                                  ? AppColors.secondary
                                  : AppColors.white,
                        ),
                        onPressed: widget.onBookmarkPressed,
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    foregroundImage: AssetImage("assets/images/melal_icon.png"),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                widget.account.iban,
                style: TextStyle(color: AppColors.white, fontSize: 18),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.account.accountNumber,
                  style: TextStyle(color: AppColors.white, fontSize: 18),
                ),
                Text(
                  widget.account.type,
                  style: TextStyle(color: AppColors.white),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "شماره کارت ندارد", // You can add card number to your model if needed
                  style: TextStyle(color: AppColors.white, fontSize: 18),
                ),
                Text(
                  widget.account.ownerName,
                  style: TextStyle(color: AppColors.white),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildCircularIcon(Icons.group),
                    SizedBox(width: 4),
                    _buildCircularIcon(Icons.account_balance),
                    SizedBox(width: 4),
                    _buildCircularIcon(Icons.compare_arrows),
                    SizedBox(width: 4),
                    _buildCircularIcon(Icons.credit_card),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "ریال",
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                    SizedBox(width: 2),
                    Text(
                      isBalanceVisible
                          ? formatWithCommas(
                            widget.account.balance.toString(),
                          ) //  real balance
                          : "****", //  masked balance
                      style: TextStyle(color: AppColors.white, fontSize: 18),
                    ),
                    SizedBox(width: 2),
                    IconButton(
                      icon: Icon(
                        isBalanceVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isBalanceVisible =
                              !isBalanceVisible; // 👈 toggle visibility
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

Widget _buildCircularIcon(IconData iconData) {
  return Container(
    width: 35,
    height: 35,
    decoration: BoxDecoration(
      color: AppColors.bankCardIcon, // background color
      shape: BoxShape.circle,
    ),
    child: Center(child: Icon(iconData, color: AppColors.white, size: 22)),
  );
}
