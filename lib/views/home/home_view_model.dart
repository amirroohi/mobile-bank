import 'package:flutter/material.dart';
import '../../models/transaction_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<Transaction> transactions = [];

  HomeViewModel() {
    loadTransactions();
  }

  void loadTransactions() {
    transactions = [
      Transaction(name: "مینا علمی", amount: -25000, date: "1402/02/02"),
      Transaction(name: "امیر غلامی", amount: 100000, date: "1402/02/03"),
    ];
    notifyListeners();
  }
}
