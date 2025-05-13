import 'package:flutter/material.dart';

import '../../../core/constants/app_constants.dart';

Widget BillInput() {
  return Column(
    children: [
      TextField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          labelText: 'شناسه قبض را وارد نمایید',
          prefixIcon: Icon(Icons.edit),
          suffixIcon: InkWell(
            borderRadius: BorderRadius.circular(50),
      
            onTap: () {},
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.perm_contact_calendar_outlined,
                color: AppColors.primary,
              ),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        ),
      ),
      SizedBox(height: 16,),
      Text("راهنما: ابتدا نوع قبض را مشخص کنید.",),

    ],
  );
}
