import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/account_model.dart';

class AccountService {
  Future<List<Account>> fetchAccounts() async {
    final response = await http.get(Uri.parse('https://api.example.com/accounts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Account.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load accounts');
    }
  }
}
