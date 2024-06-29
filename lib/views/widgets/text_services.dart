import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';

class TextServices extends StatelessWidget {
  const TextServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'هناك العديد من الخدمات في هذا التطبيق. ستجد هنا كل ما تحتاجه من مطاعم وكافيهات وأطباء ومستشفيات.',
      style: TextStyle(
        fontFamily: font,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black, // Adjust the color as needed
        letterSpacing: 0.8, // Adjust the letter spacing
        height: 1.5, // Adjust the line height
      ),
      textAlign: TextAlign.center, // Center the text
    );
  }
}
