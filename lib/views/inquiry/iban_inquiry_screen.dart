import 'package:flutter/material.dart';
import 'package:mobile_bank/views/transfer/transfer_receipt_screen.dart';
import 'package:pinput/pinput.dart';
import '../../core/constants/app_constants.dart';
import '../../models/bank-account.dart';
import '../home/home_screen.dart';

String otp = '';

class IbanInquiryScreen extends StatefulWidget {
  const IbanInquiryScreen({super.key});

  @override
  State<IbanInquiryScreen> createState() => _IbanInquiryScreenState();
}

class _IbanInquiryScreenState extends State<IbanInquiryScreen> {
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
        appBar: AppBar(
          title: Center(
            child: Text("استعلام شبا", style: TextStyle(fontSize: 28)),
          ),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          automaticallyImplyLeading: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: const Icon(Icons.home,size: 32,),
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
                    maxHeight: 810,
                  ),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
                Container(height: 150, color: AppColors.primary),
                Positioned(
                  top: 35,
                  left: 15,
                  right: 15,
                  child: Material(
                    color: Colors.white,
                    elevation: 3,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 220,
                      margin: EdgeInsets.only(top: 25),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Form(
                        child: Column(
                          spacing: 20,
                          children: [
                            TextFormField(
                              maxLength: 24,
                              decoration: InputDecoration(
                                suffixText: 'IR',
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                labelText: 'شماره شبا',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              validator:
                                  (value) =>
                                      value == null || value.length < 4
                                          ? 'رمز عبور باید حداقل ۴ کاراکتر باشد'
                                          : null,
                            ),
                            Center(
                              child: Text(
                                "شماره شبا با IR شروع می شود و شامل 26 کاراکتر می باشد.",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 320,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Text(
                      "جزییات استعلام",
                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Positioned(
                  top: 370,
                  left: 15,
                  right: 15,
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      height: 250,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Column(
                        spacing: 18,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ],
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
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Pinput(
                                        length: 6,
                                        defaultPinTheme: PinTheme(
                                          width: 56,
                                          height: 56,
                                          textStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        focusedPinTheme: PinTheme(
                                          width: 56,
                                          height: 56,
                                          textStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.blue,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                        onCompleted: (value) {
                                          setState(() {
                                            otp = value;
                                          });
                                          print('Entered OTP: $otp');
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('زمان باقی مانده'),
                                        const Text("درخواست مجدد"),
                                      ],
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text(
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
                                    child: const Text(
                                      "تأیید",
                                      style: TextStyle(color: AppColors.white),
                                    ),
                                    onPressed: () {
                                      if (otp == '123456') {
                                        // Replace with actual validation logic
                                        Navigator.of(
                                          context,
                                        ).pop(); // Close dialog

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    TransferReceiptScreen(),
                                          ),
                                        );
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.green,
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
                                            backgroundColor:
                                                Colors.red.shade500,
                                            content: Text(
                                              "کد وارد شده صحیح نیست",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
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
                        "استعلام",
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
