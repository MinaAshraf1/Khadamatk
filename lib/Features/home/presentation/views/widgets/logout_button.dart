import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';
import 'package:gradproject/main.dart';
import 'package:gradproject/views/home_view.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        prefs.remove('isLoggedIn');
        prefs.remove('token');
        Navigator.of(context).pushReplacementNamed(HomeView.homeId);
      },
      color: purple,
      padding: const EdgeInsets.all(5),
      textColor: Colors.white,
      shape: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(7)),
      child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "تسجيل الخروج",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.logout,
              size: 35,
              color: Colors.white,
            ),
          ]),
    );
  }
}
