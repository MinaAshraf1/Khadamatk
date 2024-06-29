import 'package:flutter/material.dart';

class CustomTextIcon extends StatelessWidget {
  final String text;
  final String icon;
  const CustomTextIcon({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          const SizedBox(height: 20,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Image.asset(icon, height: 24,),
              ),

              Text(
                text,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                ),
              ),
            ]
          ),

          const SizedBox(height: 10,),
        ],
      ),
    );
  }

}