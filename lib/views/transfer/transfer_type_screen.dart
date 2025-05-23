import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../widgets/custom_app_bar.dart';
import '../home/home_screen.dart';
import 'widgets/transfer_header_icon.dart';
import 'widgets/transfer_method_list.dart';

class TransferTypeScreen extends StatelessWidget {
  const TransferTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "نوع انتقال",
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: const Icon(Icons.home, size: 32),
                tooltip: 'خانه',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 770, maxHeight: 830),
                  child: Container(color: AppColors.white),
                ),
                Container(height: 150, color: AppColors.primary),
                Positioned(
                  top: 65,
                  left: 15,
                  right: 15,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.white,
                      ),
                      child: const Column(
                        spacing: 60,
                        children: [
                          SizedBox(height: 00),
                          Text(
                            "روش انتقال خود را مشخص کنید",
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          TransferMethodList(),
                        ],
                      ),
                    ),
                  ),
                ),
                const TransferHeaderIcon(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
