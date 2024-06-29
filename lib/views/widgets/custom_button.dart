import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.hint,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });
  final String hint;
  final Color? color;
  final Color? backgroundColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        onPressed: onPressed,
        child: Text(
          hint,
          style: TextStyle(fontFamily: font, color: color, fontSize: 20),
        ));
  }
}
