import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/number_to_word.dart';
import '../../../widgets/price_input_field.dart';

class LoanFormFields extends StatelessWidget {
  final TextEditingController amountController;

  const LoanFormFields({
    super.key,
    required this.amountController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              counterText: "",
              labelText: "شماره تسهیلات",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.perm_contact_calendar_outlined,
                  color: AppColors.primary,
                ),
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 30),
          PriceInputField(controller: amountController),
          const SizedBox(height: 10),
          NumberToWordsText(
            number: amountController.text.isEmpty
                ? null
                : int.tryParse(amountController.text.replaceAll(',', '')),
            textStyle: TextStyle(
              fontSize: 13,
              color: Colors.green.shade800,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
