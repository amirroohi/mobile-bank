import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class SelectedListScreen extends StatefulWidget {
  const SelectedListScreen({super.key});

  @override
  State<SelectedListScreen> createState() => _SelectedListScreenState();
}

class _SelectedListScreenState extends State<SelectedListScreen> {
  // Dummy accounts list
  final List<Map<String, String>> _accounts = [
    {"accountNumber": "1234567890", "title": "حساب جاری"},
    {"accountNumber": "9876543210", "title": "حساب پس‌انداز"},
    {"accountNumber": "1122334455", "title": "حساب قرض‌الحسنه"},
    {"accountNumber": "1122334456", "title": "حساب قرض‌الحسنه"},
    {"accountNumber": "1122334457", "title": "حساب قرض‌الحسنه"},
    {"accountNumber": "1122334458", "title": "حساب قرض‌الحسنه"},
    {"accountNumber": "1122334459", "title": "حساب قرض‌الحسنه"},
    {"accountNumber": "1122334460", "title": "حساب قرض‌الحسنه"},
    {"accountNumber": "1122334461", "title": "حساب قرض‌الحسنه"},
    {"accountNumber": "1122334462", "title": "حساب قرض‌الحسنه"},
    {"accountNumber": "1122334463", "title": "حساب قرض‌الحسنه"},
    {"accountNumber": "1122334464", "title": "حساب قرض‌الحسنه"},
  ];

  // Track selected account numbers
  final Set<String> _selectedAccounts = {};

  void _toggleSelection(String accountNumber) {
    setState(() {
      if (_selectedAccounts.contains(accountNumber)) {
        _selectedAccounts.remove(accountNumber);
      } else {
        _selectedAccounts.add(accountNumber);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("فهرست منتخب حساب‌ها"),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        body: Stack(
          children: [
            // ConstrainedBox(
            //   constraints: const BoxConstraints(
            //     minWidth: double.infinity,
            //     minHeight: 770,
            //     maxHeight: 790,
            //   ),
            //   child: Container(
            //     height: double.infinity,
            //     width: double.infinity,
            //     color: Colors.white,
            //   ),
            // ),
            Container(height: double.infinity, color: AppColors.primary),
            ListView.builder(
              itemCount: _accounts.length,
              itemBuilder: (context, index) {
                final account = _accounts[index];
                final isSelected = _selectedAccounts.contains(account['accountNumber']);

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    tileColor: AppColors.white,
                    leading: Icon(
                      Icons.account_balance_wallet,
                      color: AppColors.primary,
                    ),
                    title: Text(
                      account['title'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(account['accountNumber'] ?? ''),
                    trailing: IconButton(
                      icon: Icon(
                        isSelected ? Icons.bookmark : Icons.bookmark_border,
                        color: isSelected ? AppColors.secondary : Colors.grey,
                      ),
                      onPressed: () {
                        _toggleSelection(account['accountNumber']!);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        )
      ),
    );
  }
}

