import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';
import 'package:gradproject/core/utls/widget/assets.dart';

import 'package:url_launcher/url_launcher.dart';

class CustomMapButton extends StatelessWidget {
  final double latitude;
  final double longitude;

  const CustomMapButton({
    super.key,
    required this.latitude,
    required this.longitude
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 10),
      child: MaterialButton(
        onPressed: () async {

          String uri = "https://www.google.com/maps/search/?api=1&query=$longitude,$latitude";

          await launchUrl(Uri.parse(uri));
        },
        height: 55,
        textColor: Colors.white,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none
        ),
        color: purple,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Image.asset(Assets.locationIcon, height: 24,),
                ),

                const Text(
                  "اذهب الي المكان",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

}