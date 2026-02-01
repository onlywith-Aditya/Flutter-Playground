import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final matrixtime;
  final matrixtext;
  // final matrixicon;
  final String matrixicon;

  const HourlyForecastItem({
    super.key,
    // ignore: non_constant_identifier_names
    required this.matrixtime,
    // ignore: non_constant_identifier_names
    required this.matrixtext,
    // required this.matrixicon,
    required this.matrixicon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  matrixtime,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                // Icon(Icons.ice_skating_outlined, size: 40),
                Image.network(
                  'https:$matrixicon', // Prepend `https:` if it's missing
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(matrixtext, style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
