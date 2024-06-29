import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';
import 'package:gradproject/views/widgets/custom_button.dart';

class RowMore extends StatelessWidget {
  const RowMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomButton(
          hint: 'تفقد الخدمات',
          color: Colors.white,
          backgroundColor: purple,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(
            'قراءة المزيد',
            style: TextStyle(
              fontFamily: font,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Icon(Icons.arrow_forward)
      ],
    );
  }
}
