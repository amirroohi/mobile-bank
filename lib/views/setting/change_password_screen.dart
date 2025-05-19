

import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isObscureCurrent = true;
  bool _isObscureNew = true;
  bool _isObscureConfirm = true;

  void _handleChangePassword() {
    if (_formKey.currentState!.validate()) {
      // TODO: Call your password change API here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("رمز عبور با موفقیت تغییر کرد")),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تغییر رمز عبور'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                _buildPasswordField(
                  label: "رمز عبور فعلی",
                  controller: _currentPasswordController,
                  obscureText: _isObscureCurrent,
                  toggleObscure: () {
                    setState(() => _isObscureCurrent = !_isObscureCurrent);
                  },
                ),
                const SizedBox(height: 16),
                _buildPasswordField(
                  label: "رمز عبور جدید",
                  controller: _newPasswordController,
                  obscureText: _isObscureNew,
                  toggleObscure: () {
                    setState(() => _isObscureNew = !_isObscureNew);
                  },
                ),
                const SizedBox(height: 16),
                _buildPasswordField(
                  label: "تکرار رمز عبور جدید",
                  controller: _confirmPasswordController,
                  obscureText: _isObscureConfirm,
                  toggleObscure: () {
                    setState(() => _isObscureConfirm = !_isObscureConfirm);
                  },
                  validator: (value) {
                    if (value != _newPasswordController.text) {
                      return 'رمزها یکسان نیستند';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _handleChangePassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    "ذخیره تغییرات",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback toggleObscure,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator ??
              (value) {
            if (value == null || value.isEmpty) {
              return 'لطفاً $label را وارد کنید';
            }
            return null;
          },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.primary,
          ),
          onPressed: toggleObscure,
        ),
      ),
    );
  }
}

