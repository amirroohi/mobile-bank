import 'package:flutter/material.dart';

class ServiceSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const ServiceSection({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Divider(color: Colors.grey.shade200,),
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Wrap(spacing: 20, runSpacing: 20, children: items),
      ],
    );
  }
}
