import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../core/constants/app_constants.dart';

class OtpVerificationBottomSheet extends StatefulWidget {
  final Function(String) onVerified;
  final int initialTime;
  final String correctOtp;

  const OtpVerificationBottomSheet({
    Key? key,
    required this.onVerified,
    this.initialTime = 120,
    this.correctOtp = '123456',
  }) : super(key: key);

  @override
  State<OtpVerificationBottomSheet> createState() =>
      _OtpVerificationBottomSheetState();
}

class _OtpVerificationBottomSheetState extends State<OtpVerificationBottomSheet> {
  late int remainingTime;
  Timer? countdownTimer;
  bool isButtonEnabled = true;
  String otp = '';

  @override
  void initState() {
    super.initState();
    remainingTime = widget.initialTime;
    startTimer();
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  void startTimer() {
    countdownTimer?.cancel();
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime <= 1) {
        setState(() {
          isButtonEnabled = false;
          remainingTime = 0;
        });
        timer.cancel();
      } else {
        setState(() {
          remainingTime--;
        });
      }
    });
  }

  void resetTimer() {
    setState(() {
      remainingTime = widget.initialTime;
      isButtonEnabled = true;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "تأیید تراکنش",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text("کد تایید ارسال شده را وارد کنید."),
                const SizedBox(height: 12),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    autofocus: true,
                    length: 6,
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(fontSize: 20, color: AppColors.primary),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(fontSize: 20, color: AppColors.primary),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onCompleted: (value) {
                      otp = value;
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('زمان باقی مانده: $remainingTime ثانیه'),
                    TextButton(
                      onPressed: resetTimer,
                      child: const Text("درخواست مجدد"),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text("انصراف", style: TextStyle(color: AppColors.primary)),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isButtonEnabled ? AppColors.primary : Colors.grey,
                      ),
                      onPressed: isButtonEnabled
                          ? () {
                        if (otp == widget.correctOtp) {
                          Navigator.of(context).pop();
                          widget.onVerified(otp);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red.shade500,
                              content: const Text(
                                "کد وارد شده صحیح نیست",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
                      }
                          : null,
                      child: const Text("تأیید", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
