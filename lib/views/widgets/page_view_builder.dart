import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';
import 'package:gradproject/views/widgets/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewExample extends StatefulWidget {
  const PageViewExample({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200.0,
          height: 300.0,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3,
            itemBuilder: (context, index) {
              // Replace this with your actual item builder logic
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kPrimaryColor,
                    border: Border.all(
                      color: purple,
                      width: 3,
                    )),
                child: const Content(),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: const ExpandingDotsEffect(
              spacing: 10.0,
              expansionFactor: 4,
              radius: 40.0,
              dotWidth: 10.0,
              dotHeight: 10,
              dotColor: Colors.grey,
              activeDotColor: purple),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'خدمه 1',
          style: TextStyle(
              fontFamily: font,
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 30,
          child: Divider(
            color: Colors.black, // يمكنك تعديل لون الخط هنا
            thickness: 5.0,
          ),
        ),
        Text(
          'هناك العديد من الخدمات في هذا التطبيق. ستجد هنا كل ما تحتاجه من مطاعم وكافيهات وأطباء ومستشفيات.',
          style: TextStyle(
            fontFamily: font,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Adjust the color as needed
            letterSpacing: 0.8, // Adjust the letter spacing
            height: 1.5, // Adjust the line height
          ),
          textAlign: TextAlign.center, // Center the text
        ),
        CustomButton(
          hint: 'اقرا المزيد',
          color: Colors.white,
          backgroundColor: purple,
        )
      ],
    );
  }
}
