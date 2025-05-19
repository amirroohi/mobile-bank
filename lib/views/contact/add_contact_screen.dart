import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../home/home_screen.dart';
import '../transfer/widgets/transfer_continue_button.dart';

class AddContactScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: Center(
            child: Text("افزودن منتخب", style: TextStyle(fontSize: 28)),
          ),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          automaticallyImplyLeading: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: const Icon(Icons.home, size: 32),
                tooltip: 'خانه',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: double.infinity,
                    minHeight: 770,
                    maxHeight: 790,
                  ),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
                Container(height: 150, color: AppColors.primary),
                Positioned(
                  top: 25,
                  left: 15,
                  right: 15,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 430,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          // Form Card
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Form(
                                key: _formKey,
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    spacing: 12,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DropdownSearch<String>(
                                        popupProps: PopupProps.menu(
                                          title: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                    left: Radius.circular(50),
                                                    right: Radius.circular(50),
                                                  ),
                                              color: Colors.grey.shade200,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            child: Text(
                                              "انتخاب نوع مقصد",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          fit: FlexFit.loose,
                                          itemBuilder:
                                              (context, item, isSelected) =>
                                                  Directionality(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    child: ListTile(
                                                      title: Text(
                                                        item,
                                                        textAlign:
                                                            TextAlign.right,
                                                      ),
                                                    ),
                                                  ),
                                          showSearchBox: false,
                                          menuProps: MenuProps(
                                            backgroundColor: Colors.white,
                                            elevation: 4,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        dropdownDecoratorProps:
                                            DropDownDecoratorProps(
                                              dropdownSearchDecoration:
                                                  InputDecoration(
                                                    labelText: "نوع مقصد",
                                                    labelStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    prefixIcon: Text(""),
                                                    suffixIcon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            50,
                                                          ),
                                                    ),
                                                  ),
                                            ),

                                        onChanged: (value) {
                                          print("Selected: $value");
                                        },
                                        items: ["سپرده", "کارت", "شبا"],
                                      ),
                                      const SizedBox(height: 16),
                                      _buildInputField(
                                        label: 'شماره منتخب',
                                        hint: 'شماره منتخب خود را وارد نمایید',
                                        icon: Icons.edit,
                                      ),
                                      const SizedBox(height: 12),
                                      _buildInputField(
                                        label: 'نام منتخب',
                                        hint: 'نام منتخب خود را وارد نمایید',
                                        icon: Icons.person,
                                      ),
                                      const SizedBox(height: 12),
                                      _buildInputField(
                                        label: 'عنوان منتخب',
                                        hint: 'عنوان منتخب خود را وارد نمایید',
                                        icon: Icons.check_box_outline_blank,
                                      ),

                                      const SizedBox(height: 32),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // ✅ Submit button
                const Positioned(
                  bottom: 30,
                  right: 0,
                  left: 0,
                  child: TransferContinueButton(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        TextFormField(
          decoration: InputDecoration(
            counterText: "",
            labelText: label,
            labelStyle: TextStyle(fontSize: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            fillColor: Colors.grey.shade100,
            prefixIcon: Icon(icon),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ],
    );
  }
}
