import 'package:flutter/material.dart';
import '../../data/repositories/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository repository;

  LoginViewModel({required this.repository});

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  Future<bool> login() async {
    if (!formKey.currentState!.validate()) return false;

    isLoading = true;
    notifyListeners();

    try {
      final user = await repository.login(
        usernameController.text,
        passwordController.text,
      );
      // You might want to save user.token here
      return true;
    } catch (e) {
      debugPrint('Login error: $e');
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
