import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransferHeaderIcon extends StatelessWidget {
  const TransferHeaderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 25,
      left: MediaQuery.of(context).size.width / 2 - 40,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
        child: const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.deepOrangeAccent,
          child: Icon(Icons.checklist, size: 50, color: Colors.white),
        ),
      ),
    );
  }
}
