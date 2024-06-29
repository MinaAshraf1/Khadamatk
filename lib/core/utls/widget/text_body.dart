import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';

class TextBody extends StatelessWidget {
  final String name;
  final bool? pass;
  final String imageLink;
  final bool secure;
  final bool hide;
  final String? hint;
  final void Function()? onHide;
  final TextInputType? keyboardType;
  final TextEditingController textController;

  const TextBody({
    super.key,
    required this.name,
    required this.imageLink,
    required this.secure,
    required this.hide,
    this.onHide,
    required this.textController,
    this.keyboardType,
    this.pass,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              imageLink,
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 10),
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
              controller: textController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "لا يمكن ان يكون $name فارغ";
                }

                return null;
              },
              textDirection: TextDirection.rtl,
              obscureText: secure ? hide : false,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: hint ?? "ادخل $name",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                suffixIcon: secure
                    ? IconButton(
                        onPressed: onHide,
                        iconSize: 25,
                        color: hide ? Colors.black : purple,
                        icon: const Icon(Icons.visibility_off))
                    : null,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                        color: purple, width: 2, style: BorderStyle.solid)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                        style: BorderStyle.solid)),
              )),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
