import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';

class StackOne extends StatelessWidget {
  const StackOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: purple,
          ),
        ),
        Positioned(
          top: -10,
          left: 40,
          child: Text(
            'خدماتك',
            style: TextStyle(
                fontFamily: font, fontSize: 90, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
