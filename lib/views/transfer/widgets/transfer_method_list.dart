import 'package:flutter/material.dart';
import 'package:mobile_bank/views/transfer/widgets/transfer_method_button.dart';

import '../transfer_confirmation_screen.dart';

class TransferMethodList extends StatelessWidget {
  const TransferMethodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransferMethodButton(
          title: "کارت به کارت",
          subtitle: "بانک مقصد این روش را پشتیبانی نمی کند",
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TransferConfirmationScreen())),
        ),
        const SizedBox(height: 10),
        TransferMethodButton(
          title: "بین بانکی (پایا)",
          subtitle: "انتقال در امروز، ساعت 19:45 | کارمزد 3000ريال",
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TransferConfirmationScreen())),
        ),
        const SizedBox(height: 10),
        TransferMethodButton(
          title: "بین بانکی (ساتنا)",
          subtitle: "انتقال در لحظه| کارمزد 10000ريال",
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TransferConfirmationScreen())),
        ),
        const SizedBox(height: 10),
        TransferMethodButton(
          title: "ملل به ملل",
          subtitle: "انتقال در لحظه بدون کارمزد",
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TransferConfirmationScreen())),
        ),
      ],
    );
  }
}
