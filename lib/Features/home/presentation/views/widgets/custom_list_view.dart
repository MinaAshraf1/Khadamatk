import 'package:flutter/material.dart';
import 'package:gradproject/Features/home/data/models/category_model.dart';
import 'package:gradproject/Features/home/presentation/views/widgets/service_image.dart';

class CutomListView extends StatelessWidget {
  const CutomListView({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20),
          child: ServiceImage(category: categories[index]),
        );
      },
    );
  }
}
