import 'package:flutter/material.dart';
import 'package:gradproject/Features/search_services/presentation/views/widgets/search_service_body.dart';

class SearchService extends StatelessWidget {
  const SearchService({super.key});
  static const serviceSearchId = 'SearchService';
  @override
  Widget build(BuildContext context) {
    return const SearchServiceBody();
  }
}
