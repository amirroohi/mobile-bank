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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("رمز عبور با موفقیت تغییر کرد")));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('تغییر رمز عبور')),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          actions: [SizedBox(width: 40)],
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Container(height: 820, color: AppColors.white),
                Container(height: 150, color: AppColors.primary),
                Positioned(
                  top: 25,
                  left: 15,
                  right: 15,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 450,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          // Form Card
                          SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Form(
                              key: _formKey,
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  spacing: 0,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 70,
                                      child: Text(
                                        "هشدار: لطفا در نگهداری رمز عبور خود کوشا بوده و از سپردن رمز خود به دیگران جدا خودداری نمایید. ",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    _buildPasswordField(
                                      label: "رمز عبور فعلی",
                                      controller: _currentPasswordController,
                                      obscureText: _isObscureCurrent,
                                      toggleObscure: () {
                                        setState(
                                          () =>
                                              _isObscureCurrent =
                                                  !_isObscureCurrent,
                                        );
                                      },
                                    ),
                                    _buildPasswordField(
                                      label: "رمز عبور جدید",
                                      controller: _newPasswordController,
                                      obscureText: _isObscureNew,
                                      toggleObscure: () {
                                        setState(
                                          () => _isObscureNew = !_isObscureNew,
                                        );
                                      },
                                    ),
                                    _buildPasswordField(
                                      label: "تکرار رمز عبور جدید",
                                      controller: _confirmPasswordController,
                                      obscureText: _isObscureConfirm,
                                      toggleObscure: () {
                                        setState(
                                          () =>
                                              _isObscureConfirm =
                                                  !_isObscureConfirm,
                                        );
                                      },
                                      validator: (value) {
                                        if (value !=
                                            _newPasswordController.text) {
                                          return 'رمزها یکسان نیستند';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: _handleChangePassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 100,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        "ذخیره تغییرات",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        height: 90, // Enough height to include error text without layout shift
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator:
              validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'لطفاً $label را وارد کنید';
                }
                return null;
              },
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: AppColors.primary,
              ),
              onPressed: toggleObscure,
            ),
            errorStyle: const TextStyle(height: 1.5), // Compact error text
          ),
        ),
      ),
    );
  }
}
