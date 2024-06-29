import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';
import 'package:gradproject/core/utls/widget/utils.dart';


class TitleText extends StatelessWidget {
  final String titleText;
  const TitleText({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                firstName(titleText),
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: purple
                ),
              ),
            ),

            FittedBox(
              child: Text(
                  lastName(titleText),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  )
              ),
            ),
          ]
      ),
    );
  }

}