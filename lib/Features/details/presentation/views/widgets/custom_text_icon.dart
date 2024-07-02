import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';

class CustomTextIcon extends StatelessWidget {
  final String text;
  final String? imgIcon;
  final IconData? icon;
  const CustomTextIcon({super.key, required this.text, this.icon, this.imgIcon});

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
                child: imgIcon != null
                    ? Image.asset(imgIcon!, height: 24,)
                    : Icon(icon, size: 22,),
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