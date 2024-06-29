import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed('register');
      },
      color: const Color(0xffffffff),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
      minWidth: (MediaQuery.of(context).size.width * 0.5) - 30,
      elevation: 0,
      textColor: Colors.black,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: const FittedBox(
        child: Text(
          "إنشاء حساب",
          style: TextStyle(fontSize: 18, fontFamily: "ElMessiri"),
        ),
      ),
    );
  }
}
