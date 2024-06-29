import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';

class SignButton extends StatelessWidget {
  final String name;
  const SignButton({super.key, required this.name, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: purple,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
      elevation: 0,
      textColor: Colors.white,
      minWidth: (MediaQuery.of(context).size.width * 0.5) - 30,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
      child: FittedBox(
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
