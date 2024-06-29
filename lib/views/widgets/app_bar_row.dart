import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';
import 'package:gradproject/views/widgets/custom_button.dart';
import 'package:gradproject/views/widgets/sign.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 70,
        ),
        const Spacer(),
        CustomButton(
          onPressed: () {
            Navigator.pushNamed(context, Sign.id);
          },
          hint: 'تسجيل',
          color: Colors.white,
          backgroundColor: purple,
        ),
      ],
    );
  }
}
