import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:mobile_bank/views/transfer/transfer_receipt_screen.dart';
import 'package:mobile_bank/widgets/slide_navigation.dart';
import '../../core/constants/app_constants.dart';
import '../../models/bank-account.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/otp_verification_bottom_sheet.dart';
import '../home/home_screen.dart';

String otp = '';

String cleanOtp(String value) {
  return value.replaceAll(RegExp(r'[\u200E\s]'), ''); // Removes LRM and spaces
}

class TransferConfirmationScreen extends StatefulWidget {
  const TransferConfirmationScreen({super.key});

  @override
  State<TransferConfirmationScreen> createState() =>
      _TransferConfirmationScreenState();
}

class _TransferConfirmationScreenState
    extends State<TransferConfirmationScreen> {
  final BankAccount account = BankAccount(
    ownerName: "مینا علمی",
    accountNumber: "051511242000000150",
    iban: "IR890750051511242000000150",
    type: "سپرده قرض الحسنه",
    balance: 150000000,
    logoAsset: "assets/images/bank_logo.png",
  );
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "تایید انتقال",
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: const Icon(Icons.home, size: 32),
                tooltip: 'خانه',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
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
                    maxHeight: 810,
                  ),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: AppColors.white,
                  ),
                ),
                Container(height: 150, color: AppColors.primary),
                Positioned(
                  top: 65,
                  left: 15,
                  right: 15,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 440,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Text(
                            "انتقال به",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "امیر روحی",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 20),
                          // 📥 Destination input
                          Column(
                            spacing: 18,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "از مبدا",
                                    style: TextStyle(
                                      color: Color.fromRGBO(140, 140, 140, 1.0),
                                    ),
                                  ),
                                  Text(
                                    "131232131",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "به مقصد",
                                    style: TextStyle(
                                      color: Color.fromRGBO(140, 140, 140, 1.0),
                                    ),
                                  ),
                                  Text(
                                    "8998448454455",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "نوع انتقال",
                                    style: TextStyle(
                                      color: Color.fromRGBO(140, 140, 140, 1.0),
                                    ),
                                  ),
                                  Text(
                                    "پایا",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "توضیحات",
                                    style: TextStyle(
                                      color: Color.fromRGBO(140, 140, 140, 1.0),
                                    ),
                                  ),
                                  Text(
                                    "بدهی به آقا رضا",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "تاریخ",
                                    style: TextStyle(
                                      color: Color.fromRGBO(140, 140, 140, 1.0),
                                    ),
                                  ),
                                  Text(
                                    "19:19 1403/08/20",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "مبلغ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "250000 ريال",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // 📝 Description input
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  left: MediaQuery.of(context).size.width / 2 - 40,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: AppColors.white,
                    ),
                    padding: EdgeInsets.fromLTRB(5, 3, 5, 0),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.deepOrangeAccent,
                      child:  Icon(
                        Icons.credit_card,
                        size: 50,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 540,
                  left: 15,
                  right: 15,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.white,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: DropdownSearch<String>(
                          popupProps: PopupProps.menu(
                            fit: FlexFit.loose,
                            itemBuilder:
                                (context, item, isSelected) => Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: ListTile(
                                    title: Text(
                                      item,
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ),
                            showSearchBox: true,
                            menuProps: MenuProps(
                              backgroundColor: AppColors.white,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            searchFieldProps: TextFieldProps(
                              textAlign: TextAlign.end,
                              textDirection: TextDirection.ltr,
                              decoration: InputDecoration(
                                hintText: "...جستجو",
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "بابت",
                              labelStyle: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                              ),
                              prefixIcon: Icon(Icons.edit),
                              suffixIcon: Icon(Icons.keyboard_arrow_down),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),

                          onChanged: (value) {
                            print("Selected: $value");
                          },
                          items: ["بدهی", "قبض", "قسط تسهیلات", "سرمایه گذاری"],
                          selectedItem: "بدهی",
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 0,
                  left: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          builder: (context) => OtpVerificationBottomSheet(
                            onVerified: (enteredOtp) {
                              Navigator.push(
                                context,
                                slideFromRight(TransferReceiptScreen()),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text("تراکنش با موفقیت انجام شد"),
                                ),
                              );
                            },
                          ),
                        );
                      }

                      ,

                      child: const Text(
                        "تایید تراکنش",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
