import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../widgets/price_input_field.dart';
import '../../../core/utils/number_to_word.dart';

class TransferDetailsForm extends StatelessWidget {
  final TextEditingController amountController;

  const TransferDetailsForm({super.key, required this.amountController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              labelText: "شماره حساب مقصد",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              suffixIcon: Icon(Icons.perm_contact_calendar_outlined, color: AppColors.primary),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 40),
          PriceInputField(controller: amountController),
          NumberToWordsText(
            number: amountController.text.isEmpty
                ? null
                : int.tryParse(amountController.text.replaceAll(',', '')),
            textStyle: TextStyle(fontSize: 13, color: Colors.green.shade800, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              labelText: "توضیحات",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            ),
            maxLength: 200,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}
