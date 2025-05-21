import 'package:flutter/material.dart';

class NumberToWordsText extends StatelessWidget {
  final int? number;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const NumberToWordsText({
    super.key,
    required this.number,
    this.textStyle,
    this.padding,
  });

  String _convertNumberToWords(int number) {
    if (number == 0) return "صفر";

    final units = ['', 'یک', 'دو', 'سه', 'چهار', 'پنج', 'شش', 'هفت', 'هشت', 'نه'];
    final tens = ['', 'ده', 'بیست', 'سی', 'چهل', 'پنجاه', 'شصت', 'هفتاد', 'هشتاد', 'نود'];
    final hundreds = ['', 'صد', 'دویست', 'سیصد', 'چهارصد', 'پانصد', 'ششصد', 'هفتصد', 'هشتصد', 'نهصد'];

    final parts = <String>[];
    int r = number;

    if (r >= 1000000) {
      int million = r ~/ 1000000;
      parts.add('${_convertNumberToWords(million)} میلیون');
      r %= 1000000;
    }
    if (r >= 1000) {
      int thousand = r ~/ 1000;
      parts.add('${_convertNumberToWords(thousand)} هزار');
      r %= 1000;
    }
    if (r >= 100) {
      int h = r ~/ 100;
      parts.add(hundreds[h]);
      r %= 100;
    }
    if (r >= 10) {
      int t = r ~/ 10;
      int u = r % 10;
      parts.add(tens[t] + (u > 0 ? ' و ${units[u]}' : ''));
      r = 0;
    }
    if (r > 0) {
      parts.add(units[r]);
    }

    return parts.join(' و ');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
      child: number == null
          ? const SizedBox(height: 36) // Reserve space to avoid jumpy UI
          : SizedBox(
        height: 36,
            child: Text(
                    "${_convertNumberToWords(number!)} ریال ",
                    style: textStyle ??
              const TextStyle(
                color: Color(0xFF246C1D),
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
                    softWrap: true,
                  ),
          ),
    );
  }

}
