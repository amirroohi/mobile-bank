import 'package:flutter/material.dart';
import 'package:mobile_bank/views/home/home_screen.dart';
import '../../core/constants/app_constants.dart';
import '../../models/bank-account.dart';
import '../../widgets/custom_app_bar.dart';

class TransferReceiptScreen extends StatefulWidget {
  const TransferReceiptScreen({super.key});

  @override
  State<TransferReceiptScreen> createState() => _TransferReceiptScreenState();
}

class _TransferReceiptScreenState extends State<TransferReceiptScreen> {
  bool _isContact = false;

  bool _hasAniFam = false;
  // void _changeHandler  = (){
  //
  // };

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
          title: "جزییات تراکنش",
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
                  top: 45,
                  left: 15,
                  right: 15,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 470,
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
                          SizedBox(height: 30),
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
                            spacing: 12,
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
                                    "وضعیت",
                                    style: TextStyle(
                                      color: Color.fromRGBO(140, 140, 140, 1.0),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.green.shade100,
                                    ),
                                    child: Text(
                                      "موفق",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
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
                                    "تست",
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
                  top: 5,
                  left: MediaQuery.of(context).size.width / 2 - 40,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: AppColors.white,
                    ),
                    padding: EdgeInsets.fromLTRB(5, 3, 5, 0),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.download_done,
                        size: 40,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 530,
                  left: 15,
                  right: 15,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 150,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Column(
                          children: [
                            SwitchListTile(
                              activeTrackColor: Colors.green,
                              activeColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              tileColor: Color.fromRGBO(236, 236, 236, 1.0),
                              secondary: Icon(Icons.perm_contact_calendar),
                              title: Text("افزودن به منتخب"),
                              value: _isContact,
                              onChanged: (bool value) {
                                setState(() {
                                  _isContact = value;
                                });
                              },
                            ),
                            SwitchListTile(
                              activeTrackColor: Colors.green,
                              activeColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              tileColor: Color.fromRGBO(236, 236, 236, 1.0),
                              secondary: Icon(Icons.add_card),
                              title: Text("افزودن به آنی فام"),
                              value: _hasAniFam,
                              onChanged: (bool value) {
                                setState(() {
                                  _hasAniFam = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 700,
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            String otp = '';

                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: const Text("تأیید تراکنش"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "کد تایید ارسال شده را وارد کنید.",
                                    ),
                                    const SizedBox(height: 12),
                                    TextField(
                                      maxLength: 6,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        hintText: 'کد OTP',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                      ),
                                      onChanged: (value) => otp = value,
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    child: Text(
                                      "انصراف",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    onPressed:
                                        () => Navigator.of(context).pop(),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                    ),
                                    child: Text(
                                      "تأیید",
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                    onPressed: () {
                                      if (otp == '') {
                                        // Replace with actual validation logic
                                        Navigator.of(
                                          context,
                                        ).pop(); // Close dialog

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                          ),
                                        );
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              "تراکنش با موفقیت انجام شد",
                                            ),
                                          ),
                                        );
                                      } else {
                                        // Show error or handle incorrect OTP
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              "کد وارد شده صحیح نیست",
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },

                      child: const Text(
                        "رسید تراکنش",
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
