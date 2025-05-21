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

  String? _selectedAccount; // <-- Only one selected at a time
  Set<String> _favoriteAccounts = {};


  // void _selectAccount(String accountNumber) {
  //   setState(() {
  //     if (_selectedAccount == accountNumber) {
  //       _selectedAccount = null; // Unselect if tapped again
  //     } else {
  //       _selectedAccount = accountNumber;
  //     }
  //   });
  // }
  void _selectAccount(String accountNumber) {
    setState(() {
      _selectedAccount = (_selectedAccount == accountNumber)
          ? null
          : accountNumber;
    });
  }

  void _toggleFavorite(String accountNumber) {
    setState(() {
      if (_favoriteAccounts.contains(accountNumber)) {
        _favoriteAccounts.remove(accountNumber);
      } else {
        _favoriteAccounts.add(accountNumber);
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
        body: Container(
          color: AppColors.primary,
          child: ListView.builder(
            itemCount: _accounts.length,
            itemBuilder: (context, index) {
              final account = _accounts[index];
              final isSelected = _selectedAccount == account['accountNumber'];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  tileColor: AppColors.white,
                  leading: Icon(
                    Icons.account_balance_wallet,
                    color: AppColors.primary,
                  ),
                  title: Text(
                    account['title'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  subtitle: Text(
                    account['accountNumber'] ?? '',
                    style: const TextStyle(color: AppColors.primary),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          _favoriteAccounts.contains(account['accountNumber'])
                              ? Icons.star
                              : Icons.star_border,
                          color: _favoriteAccounts.contains(account['accountNumber'])
                              ? Colors.amber
                              : Colors.grey,
                        ),
                        onPressed: () {
                          _toggleFavorite(account['accountNumber']!);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          _selectedAccount == account['accountNumber']
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: _selectedAccount == account['accountNumber']
                              ? AppColors.secondary
                              : Colors.grey,
                        ),
                        onPressed: () {
                          _selectAccount(account['accountNumber']!);
                        },
                      ),
                    ],
                  ),

                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
