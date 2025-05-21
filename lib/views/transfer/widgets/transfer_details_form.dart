import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../widgets/price_input_field.dart';
import '../../../core/utils/number_to_word.dart';

class TransferDetailsForm extends StatefulWidget {
  final TextEditingController amountController;

  const TransferDetailsForm({super.key, required this.amountController});

  @override
  State<TransferDetailsForm> createState() => _TransferDetailsFormState();
}

class _TransferDetailsFormState extends State<TransferDetailsForm> {
  int? parsedAmount;

  @override
  void initState() {
    super.initState();
    widget.amountController.addListener(_onAmountChanged);
    _onAmountChanged(); // Initialize with first value
  }

  void _onAmountChanged() {
    final cleaned = widget.amountController.text.replaceAll(',', '');
    final parsed = int.tryParse(cleaned);
    setState(() {
      parsedAmount = parsed;
    });
  }

  @override
  void dispose() {
    widget.amountController.removeListener(_onAmountChanged);
    super.dispose();
  }

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
              suffixIcon: const Icon(Icons.perm_contact_calendar_outlined, color: AppColors.primary),
            ),
            keyboardType: TextInputType.number,
          ),

          const SizedBox(height: 40),

          PriceInputField(controller: widget.amountController),

          const SizedBox(height: 8),

          NumberToWordsText(
            number: parsedAmount,
            textStyle: TextStyle(
              fontSize: 13,
              color: Colors.green.shade800,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 10),

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
