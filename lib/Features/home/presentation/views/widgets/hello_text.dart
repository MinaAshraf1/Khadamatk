import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';

class HelloText extends StatelessWidget {
  final String name;
  const HelloText({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "اهلا ",
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 24, color: purple),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
