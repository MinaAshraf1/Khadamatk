import 'package:flutter/material.dart';
import 'package:gradproject/Features/home/presentation/views/main_page.dart';
import 'package:gradproject/main.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    );

    // Initialize opacity animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _animationController.forward();

    // Delay and navigate to the next page
    Future.delayed(const Duration(seconds: 4), () async {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      Navigator.pushReplacementNamed(context, isLoggedIn ? MainPage.homePageId : 'homeViewBody',);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _opacityAnimation,
        builder: (context, child) {
          return Opacity(
            opacity: _opacityAnimation.value,
            child: child,
          );
        },
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the animation controller
    _animationController.dispose();
    super.dispose();
  }
}
