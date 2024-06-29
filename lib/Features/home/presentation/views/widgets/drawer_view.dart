import 'package:flutter/material.dart';
import 'package:gradproject/Features/home/data/models/user_data.dart';
import 'package:gradproject/Features/home/presentation/views/widgets/data.dart';
import 'package:gradproject/Features/home/presentation/views/widgets/hello_text.dart';
import 'package:gradproject/Features/home/presentation/views/widgets/logout_button.dart';
import 'package:gradproject/const.dart';

class DrawerView extends StatelessWidget {
  final UserData userData;
  const DrawerView({
    Key? key,
    required this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: purple,
                  icon: const Icon(Icons.arrow_back),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * .1),
              ],
            ),
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 10),
            HelloText(name: userData.firstName!),
            const SizedBox(height: 30),
            Data(
              data: userData.userName!,
              icon: Icons.person_sharp,
            ),
            Data(
              data: userData.email!,
              icon: Icons.alternate_email,
            ),
            Data(
              data: userData.phone!,
              icon: Icons.phone,
            ),
            Data(
              data: userData.city!,
              icon: Icons.location_city,
            ),
            const SizedBox(height: 50),
            const LogoutButton()
          ],
        ),
      ),
    );
  }
}
