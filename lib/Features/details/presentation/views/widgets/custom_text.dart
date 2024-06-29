import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Color(0xff8E8E93)
          ),
        )
    );
  }

}