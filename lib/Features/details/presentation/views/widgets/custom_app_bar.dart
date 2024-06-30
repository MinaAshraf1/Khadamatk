import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  final String titleText;
  final String titleIcon;

  const CustomAppBar(
      {super.key, required this.titleText, required this.titleIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/logo1.png',
            width: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            height: 30,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                titleText,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            iconSize: 30,
            color: Colors.black,
            icon: const FaIcon(FontAwesomeIcons.arrowLeftLong),
          ),
        ],
      ),
    );
  }
}
