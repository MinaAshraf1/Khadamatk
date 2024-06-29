import 'package:flutter/material.dart';

class CustomMainImage extends StatelessWidget {
  final String mainImagePath;
  const CustomMainImage({super.key, required this.mainImagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      child: AspectRatio(
        aspectRatio: 335 / 357,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Image.asset(
            mainImagePath,
            fit: BoxFit.fill,
          ),
        ),
      )
    );
  }

}