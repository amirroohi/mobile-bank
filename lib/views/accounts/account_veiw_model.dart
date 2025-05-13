import 'package:flutter/material.dart';

import '../../data/repositories/account_repository.dart';
import '../../models/account_model.dart';


class AccountViewModel extends ChangeNotifier {
  final AccountRepository repository;

  AccountViewModel(this.repository);

  List<Account> _accounts = [];
  List<Account> get accounts => _accounts;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> fetchAccounts() async {
    _loading = true;
    notifyListeners();

    try {
      _accounts = await repository.getAllAccounts();
    } catch (e) {
      print("Failed to fetch accounts: $e");
    }

    _loading = false;
    notifyListeners();
  }
}
