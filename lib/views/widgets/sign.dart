import 'package:flutter/material.dart';
import 'package:gradproject/core/utls/widget/register_button.dart';
import 'package:gradproject/core/utls/widget/sign_button.dart';
import 'package:gradproject/core/utls/widget/sign_logo.dart';

class Sign extends StatelessWidget {
  const Sign({super.key});
  static const id = 'sign';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: width,
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(
                flex: 3,
              ),
              const SignLogo(),
              const Spacer(
                flex: 2,
              ),
              Image.asset(
                "assets/images/page.png",
                width: width * .8,
              ),
              const Spacer(
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RegisterButton(),
                  SignButton(
                    name: "تسجيل الدخول",
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("login");
                    },
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
