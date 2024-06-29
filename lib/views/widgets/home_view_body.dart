import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';
import 'package:gradproject/views/widgets/app_bar_row.dart';
import 'package:gradproject/views/widgets/stack_one.dart';
import 'package:gradproject/views/widgets/stack_three.dart';
import 'package:gradproject/views/widgets/stack_two.dart';
import 'package:gradproject/views/widgets/text_services.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late Timer _timer;
  int _currentIndex = 0;
  final List<String> _imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREmaRtPeXW39hx9xYYgNmVLGpqIafJUYwDNg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFYGR9E4eLktrvpCeoS9N7VafEF5npvnW4zA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo8dYljt_z0X12FoBlTG3JQ-utUTelcYbffw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEmTokcY-ssy44ykysFt3gKSWjKtwlvq3Y5g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1mZ36kzb8GDq4LavRkKXQIWHNK_G_CoIcHQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKxzdJsDtpaiPkb4F-OevoHZfdtY5URsfjUw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIOqyIB9op-Cq_Z_IhZwE7VPGrWl2NMY7Png&s',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_currentIndex < _imageUrls.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const AppBarRow(),
            const Divider(thickness: 3),
            const SizedBox(height: 40),
            const StackOne(),
            const Text(
              'كلها بسيطة وسهلة',
              style: TextStyle(
                  fontFamily: font, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    _imageUrls[_currentIndex],
                    key: UniqueKey(),
                    fit: BoxFit.cover,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const TextServices(),
            const SizedBox(height: 20),
            const SizedBox(height: 60),
            const StackTwo(),
            const SizedBox(height: 120),
            const StackThree(),
          ],
        ),
      ),
    );
  }
}
