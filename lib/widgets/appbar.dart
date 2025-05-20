import 'package:flutter/material.dart';

import '../core/constants/app_constants.dart';

class CustomHeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: preferredSize.height,
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  'AppBar Demo',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon:  Icon(Icons.add_alert, color: AppColors.white),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('This is a snackbar')),
                        );
                      },
                    ),
                    IconButton(
                      icon:  Icon(
                        Icons.navigate_next,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => Scaffold(
                                  appBar: AppBar(
                                    title: const Text('Next Page'),
                                  ),
                                  body: const Center(
                                    child: Text('This is the next page'),
                                  ),
                                ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -35, // move floating action button outside container
          left: MediaQuery.of(context).size.width / 2 - 35,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.white,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.qr_code_scanner,
              color: Colors.deepOrangeAccent,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
