import 'package:flutter/material.dart';
import 'package:gradproject/Features/details/data/models/details/details.dart';
import 'package:gradproject/Features/details/presentation/views/widgets/service_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.details, required this.url});
final List<Details> details;
final String url;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
   
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 5.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: details.length,
        itemBuilder: (context, index) {
          return  ServiceItem(details: details[index],url: url,);
        });
  }
}
