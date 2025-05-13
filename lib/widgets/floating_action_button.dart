import 'package:flutter/material.dart';

class FloatingActionButtonCustom extends StatelessWidget {
  const FloatingActionButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 80,
      height: 80,
      child: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {},
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white,
        child: const Icon(Icons.qr_code_scanner, size: 40),
      ),
    );
  }
}
