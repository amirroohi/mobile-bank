import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_bank/views/anifam/anifam_screen.dart';
import 'package:mobile_bank/views/bill/bill_payment_screen.dart';
import 'package:mobile_bank/views/charge/buy_charge_screen.dart';
import 'package:mobile_bank/views/charity/charity_screen.dart';
import 'package:mobile_bank/views/contact/add_contact_screen.dart';
import 'package:mobile_bank/views/inquiry/iban_inquiry_screen.dart';
import 'package:mobile_bank/views/laon/loan_repayment_screen.dart';
import 'package:mobile_bank/views/transactions/transaction_list_screen.dart';

import '../../widgets/service_item.dart';
import '../../widgets/service_section.dart';
import '../home/home_screen.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final TextEditingController _searchController = TextEditingController();

  late List<ServiceGroup> allServiceGroups;
  List<ServiceGroup> filteredServiceGroups = [];

  void _navigateToService(String title) {
    switch (title) {
      case "قرارداد ها":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
        break;
      case "بازپرداخت":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => LoanRepaymentScreen()),
        );
        break;
      case "جزئیات":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
        break;
      case "در انتظار تایید":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
        break;
      case "گزارشات":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
        break;
      case "صیاد":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
        break;
      case "مسدودی":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
        break;
      case "وضعیت دسته چک":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
        break;
      case "چک های برگشتی":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
        break;
      case "تسهیلات":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
        break;
      case "شبا":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => IbanInquiryScreen()),
        );
        break;
      case "نیکوکاری":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CharityScreen()),
        );
        break;
      case "پرداخت قبوض":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => BillPaymentScreen()),
        );
        break;
      case "خرید شارژ":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => BuyChargeScreen()),
        );
        break;
      case "افزودن منتخب":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AddContactScreen()),
        );
        break;
      case "آنی فام":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AnifamScreen()),
        );
        break;
      case "فهرست تراکنش ها":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => TransactionListScreen()),
        );
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("صفحه‌ای برای '${title}' تعریف نشده است")),
        );
    }
  }

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
          ServiceItemData("آنی فام", Icons.speed_outlined),
        ],
      ),
    ];
    filteredServiceGroups = allServiceGroups;
  }

  void _filterServices(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredServiceGroups = allServiceGroups;
        log(1);
      } else {
        filteredServiceGroups =
            allServiceGroups
                .map((group) {
                  final filteredItems =
                      group.items
                          .where((item) => item.title.contains(query))
                          .toList();
                  return ServiceGroup(title: group.title, items: filteredItems);
                })
                .where((group) => group.items.isNotEmpty)
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("خدمات", style: TextStyle(fontSize: 28)),
          ),
          backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
          foregroundColor: const Color(0xFF1D4B7E),
          automaticallyImplyLeading: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: const Icon(Icons.home, size: 32),
                tooltip: 'خانه',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ),
          ],
          leading: SizedBox(width: 0),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: ListView(
              padding: EdgeInsets.only(bottom: 20),
              children: [
                const SizedBox(height: 10),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterServices,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: "جستجو خدمات",
                      suffixIcon: const Icon(Icons.search_outlined),
                      filled: true,
                      fillColor: const Color(0xFFF3F6FA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          width: 5,
                          color: Color(0xFFF3F6FA),
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...filteredServiceGroups.map(
                        (group) => ServiceSection(
                          title: group.title,
                          items:
                              group.items.map((item) {
                                return ServiceItem(
                                  title: item.title,
                                  icon: item.icon,
                                  onTap: () => _navigateToService(item.title),
                                );
                              }).toList(),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceGroup {
  final String title;
  final List<ServiceItemData> items;

  ServiceGroup({required this.title, required this.items});
}

class ServiceItemData {
  final String title;
  final IconData icon;

  ServiceItemData(this.title, this.icon);
}
