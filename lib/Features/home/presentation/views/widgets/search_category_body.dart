import 'package:flutter/material.dart';
import 'package:gradproject/Features/home/data/models/category_model.dart';
import 'package:gradproject/Features/home/presentation/views/widgets/app_bar_view.dart';
import 'package:gradproject/Features/home/presentation/views/widgets/custom_list_view.dart';

import 'package:gradproject/core/utls/widget/custom_text_feild.dart';

class SearchCategoryBody extends StatefulWidget {
  const SearchCategoryBody({super.key});

  @override
  State<SearchCategoryBody> createState() => _SearchCategoryBodyState();
}

class _SearchCategoryBodyState extends State<SearchCategoryBody> {
  String? search;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: AppBarView(
              text: 'الخدمه',
              icon: Icons.arrow_forward,
              onPressed: () {
                Navigator.pop(context);
                FocusScope.of(context).unfocus();
              },
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  CustomTextField(
                    foucs: true,
                    onChanged: (p0) {
                      setState(() {
                        search = p0;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 500,
                    child: CutomListView(
                        categories: Category.categories
                            .where((s) => s.name.contains(search ?? ""))
                            .toList()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
