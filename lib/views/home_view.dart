import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';
import 'package:gradproject/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const homeId = 'Home';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: HomeViewBody(),
    );
  }
}
