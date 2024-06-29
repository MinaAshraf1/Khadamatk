import 'package:flutter/material.dart';
import 'package:gradproject/Features/home/presentation/views/main_page.dart';
import 'package:gradproject/const.dart';

class StackTwo extends StatelessWidget {
  const StackTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        CircleAvatar(
          backgroundColor: purple,
          radius: 60,
        ),
        //Image.asset('assets/images/logo3.png',height: 300,),
        Stack(children: [
          Padding(
            padding: EdgeInsets.all(50),
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              child: Center(
                child: Text(
                  'كل الخدمات',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 100,
            child: Text(
              'استطلع',
              style: TextStyle(
                  fontFamily: font,
                  color: purple,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ],
    );
  }
}
