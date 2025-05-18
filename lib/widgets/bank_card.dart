import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/utils/text_mask.dart';
import '../models/bank-account.dart';

class BankCard extends StatefulWidget {
  final BankAccount account;
  // you can send assetsImage to this

  const BankCard({super.key, required this.account});

  @override
  State<BankCard> createState() => _BankCardState();
}

class _BankCardState extends State<BankCard> {
  bool isBalanceVisible = false; // Add this in your state
  bool isBookmarked = false; // state variable
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
      items: [
        PopupMenuItem(child: Text('گزینه اول')),
        PopupMenuItem(child: Text('گزینه دوم')),
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
          colors: [Color(0xFF1D4F7A), Color(0xFFA8A8A8), Color(0xFF2E75B6)],
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
                        key: _menuKey,
                        icon: Icon(Icons.more_vert, color: AppColors.white),
                        onPressed: _showPopupMenu,
                      ),

                      // 🔖 Bookmark toggle
                      IconButton(
                        icon: Icon(
                          isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border_outlined,
                          color:
                              isBookmarked
                                  ? AppColors.secondary
                                  : AppColors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isBookmarked = !isBookmarked;
                          });
                        },
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
                          ) // 👈 real balance
                          : "****", // 👈 masked balance
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
