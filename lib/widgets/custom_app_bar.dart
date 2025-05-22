import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final List<Widget>? actions;
  final bool centerTitle;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = AppColors.white,
    this.actions,
    this.centerTitle = true,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: foregroundColor)),
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      elevation: 0,
      leading: leading,
      actions: actions,
      iconTheme: IconThemeData(color: foregroundColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
