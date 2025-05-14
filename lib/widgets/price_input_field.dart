import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/utils/text_mask.dart';

class PriceInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String suffix;
  final int maxLength;

  const PriceInputField({
    super.key,
    required this.controller,
    this.label = " مبلغ ",
    this.suffix = "ريال",
    this.maxLength = 11,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        ThousandsSeparatorInputFormatter(),
      ],
      decoration: InputDecoration(
        suffix: Text(suffix),
        counterText: "",
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
