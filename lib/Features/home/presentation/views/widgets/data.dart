import 'package:flutter/material.dart';
import 'package:gradproject/const.dart';

class Data extends StatelessWidget {
  final String data;
  final IconData icon;
  const Data({super.key, required this.data, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              data,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            size: 35,
            color: purple,
          ),
        ],
      ),
    );
  }
}
