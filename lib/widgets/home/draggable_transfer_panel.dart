import 'package:flutter/cupertino.dart';

import '../../core/constants/app_constants.dart';
import '../transfer_section.dart';

class DraggableTransferPanel extends StatelessWidget {
  const DraggableTransferPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.40,
      minChildSize: 0.40,
      maxChildSize: 0.70,
      builder: (context, scrollController) {
        return Container(
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary,
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: TransferSection(),
          ),
        );
      },
    );
  }
}
