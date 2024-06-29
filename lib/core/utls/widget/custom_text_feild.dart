import 'package:flutter/material.dart';

import 'package:gradproject/const.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.onTap, required this.foucs, this.onChanged});
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final bool foucs;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 3))
          ]),
      child: TextField(
          onChanged: onChanged,
          autofocus: foucs,
          onTap: onTap,
          decoration: const InputDecoration(
            hintText: 'انت بتدور على ايه',
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            suffixIcon: Icon(
              Icons.search,
              color: purple,
              size: 30,
            ),
            border: InputBorder.none,
          )),
    );
  }
}
