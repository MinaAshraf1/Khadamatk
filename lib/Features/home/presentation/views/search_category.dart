import 'package:flutter/material.dart';
import 'package:gradproject/Features/home/presentation/views/widgets/search_category_body.dart';

class SearchCategory extends StatelessWidget {
  const SearchCategory({super.key});
  static const searchCategoryId = 'categorySearch';
  @override
  Widget build(BuildContext context) {
    return const SearchCategoryBody();
  }
}
