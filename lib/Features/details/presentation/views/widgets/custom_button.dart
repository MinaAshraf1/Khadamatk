import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';
import 'package:gradproject/core/utls/widget/assets.dart';

import 'package:url_launcher/url_launcher.dart';

class CustomButton extends StatelessWidget {
  final String phone;
  const CustomButton({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 10),
      child: MaterialButton(
        onPressed: () async {
          final Uri launchUri = Uri(
            scheme: 'tel',
            path: phone
          );

          // print(phone);
          // if(await canLaunch(launchUri.toString())) {
          //   await launch(launchUri.toString());
          // }

          if(phone == "غير محدد") {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.infoReverse,

              animType: AnimType.bottomSlide,
              title: "للأسف رقم الهاتف غير متاح",
            ).show();
          } else {
            await launchUrl(launchUri);
          }
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
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image.asset(Assets.phoneIcon, height: 24,),
                  ),

                  const Text(
                    "اتصل بنا",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }

}