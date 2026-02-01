import 'package:flutter/material.dart';

class Additional_Info_Item extends StatelessWidget {
  final IconData icon;
  final String label;
  final num value;

  const Additional_Info_Item({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40),

        const SizedBox(height: 5),

        Text(label),

        const SizedBox(height: 5),

        Text(
          value.toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
