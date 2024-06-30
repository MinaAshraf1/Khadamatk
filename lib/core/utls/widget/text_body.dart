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
  final String? notes;
  final String? change;
  final Color? changeColor;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;

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
    this.notes,
    this.validator,
    this.onChanged,
    this.change,
    this.changeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),

                SizedBox(
                  width: 250,
                  height: notes != null? 15 : 0,
                  child: FittedBox(
                    child: Text(
                      notes ?? "",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
              controller: textController,
              validator: validator ?? (value) {
                if (value!.isEmpty) {
                  return "لا يمكن ان يكون $name فارغ";
                }

                return null;
              },
              onChanged: onChanged,
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

        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Text(
            change ?? "",
            style: TextStyle(
              color: changeColor,
            ),
          ),
        ),

        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
