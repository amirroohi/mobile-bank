import 'package:flutter/material.dart';
import 'package:mobile_bank/core/constants/app_constants.dart';
import '../../widgets/service_item.dart';
import '../../widgets/service_section.dart';
import '../services/services_screen.dart';

class SelectedServicesMngmntScreen extends StatefulWidget {
  const SelectedServicesMngmntScreen({super.key});

  @override
  State<SelectedServicesMngmntScreen> createState() =>
      _SelectedServicesMngmntScreenState();
}

class _SelectedServicesMngmntScreenState
    extends State<SelectedServicesMngmntScreen> {
  final Set<String> selectedTitles = {}; // Store titles of selected services

  late final List<ServiceGroup> allServiceGroups;

  @override
  void initState() {
    super.initState();
    allServiceGroups = [
      ServiceGroup(
        title: "تسهیلات",
        items: [
          ServiceItemData("قرارداد ها", Icons.credit_card),
          ServiceItemData("بازپرداخت", Icons.payments),
          ServiceItemData("جزئیات", Icons.info),
        ],
      ),
      ServiceGroup(
        title: "کارتابل تراکنش ها",
        items: [
          ServiceItemData("در انتظار تایید", Icons.bolt),
          ServiceItemData("گزارشات", Icons.receipt_long),
          ServiceItemData("فهرست تراکنش ها", Icons.receipt_long),
        ],
      ),
      ServiceGroup(
        title: "مدیریت چک",
        items: [
          ServiceItemData("صیاد", Icons.qr_code),
          ServiceItemData("مسدودی", Icons.lock),
          ServiceItemData("وضعیت دسته چک", Icons.list_alt),
        ],
      ),
      ServiceGroup(
        title: "استعلام",
        items: [
          ServiceItemData("چک های برگشتی", Icons.error),
          ServiceItemData("تسهیلات", Icons.assignment),
          ServiceItemData("شبا", Icons.numbers),
        ],
      ),
      ServiceGroup(
        title: "سایر خدمات",
        items: [
          ServiceItemData("نیکوکاری", Icons.favorite),
          ServiceItemData("پرداخت قبوض", Icons.receipt_outlined),
          ServiceItemData("خرید شارژ", Icons.receipt_outlined),
          ServiceItemData("افزودن منتخب", Icons.person_add_alt),
        ],
      ),
    ];
  }

  void _toggleService(String title) {
    setState(() {
      if (selectedTitles.contains(title)) {
        selectedTitles.remove(title);
      } else {
        selectedTitles.add(title);
      }
    });
  }

  void _saveSelection() {
    // TODO: Save to shared preferences or send to backend
    Navigator.pop(context, selectedTitles.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF3F6FA),
          title: const Text("مدیریت خدمات منتخب"),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "ذخیره",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // IconButton(
            //   icon: const Icon(Icons.save),
            //   onPressed: _saveSelection,
            //   tooltip: 'ذخیره',
            // )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              ...allServiceGroups.map(
                (group) => ServiceSection(
                  title: group.title,
                  items:
                      group.items.map((item) {
                        final isSelected = selectedTitles.contains(item.title);
                        return ServiceItem(
                          title: item.title,
                          icon: item.icon,
                          onTap: () => _toggleService(item.title),
                          isSelected:
                              isSelected, // You'll need to modify the widget
                        );
                      }).toList(),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
