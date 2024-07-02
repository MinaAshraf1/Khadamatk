import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradproject/Features/home/presentation/views/main_page.dart';

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
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(MainPage.homePageId);
            },
            child: Image.asset(
              'assets/images/logo1.png',
              width: 30,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .7,
            height: 30,
            child: FittedBox(
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
