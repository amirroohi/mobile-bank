import 'package:flutter/services.dart';

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    String newText = _formatWithCommas(digitsOnly);

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  String _formatWithCommas(String value) {
    if (value.isEmpty) return '';
    final buffer = StringBuffer();
    int offset = value.length % 3;
    if (offset > 0) buffer.write(value.substring(0, offset));

    for (int i = offset; i < value.length; i += 3) {
      if (buffer.isNotEmpty) buffer.write(',');
      buffer.write(value.substring(i, i + 3));
    }
    return buffer.toString();
  }
}
