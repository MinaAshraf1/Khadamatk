import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';

class AppBarView extends StatelessWidget {
  const AppBarView(
      {super.key, required this.text, required this.icon, this.onPressed});
  final String text;
  final Widget icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 70,
          ),
          const Spacer(),
          Text(
            text,
            style: const TextStyle(
                fontFamily: font, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            onPressed: onPressed,
            iconSize: 30,
            icon: icon
          ),
        ],
      ),
    );
  }
}
