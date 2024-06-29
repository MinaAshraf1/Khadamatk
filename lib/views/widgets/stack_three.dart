import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';

class StackThree extends StatelessWidget {
  const StackThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: purple,
          width: double.infinity,
          height: 100,
        ),
        Positioned(
            left: 40,
            top: -80,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: const Offset(0, 3), // Offset in the x and y axis
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'انجاز',
                        style: TextStyle(
                            fontFamily: font,
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '!',
                        style: TextStyle(
                            fontFamily: font,
                            color: purple,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        Positioned(
          top: -190,
          // Adjust this value to move the image upwards
          right: -60, // Adjust this value to move the image to the right
          child: Image.asset(
            'assets/images/logo3.png',
            height: 300,
          ),
        ),
      ],
    );
  }
}
