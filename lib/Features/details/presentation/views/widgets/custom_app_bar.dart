import 'package:flutter/material.dart';
import 'package:gradproject/Features/details/presentation/views/widgets/title_text.dart';

class CustomAppBar extends StatelessWidget {
  final String titleText;
  final String titleIcon;

  const CustomAppBar(
      {super.key, required this.titleText, required this.titleIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            iconSize: 40,
            color: Colors.black,
            icon: const Icon(Icons.arrow_forward),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Text(
              titleText,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Image.asset(
            'assets/images/logo1.png',
            width: 30,
          ),
        ],
      ),
    );
  }
}
