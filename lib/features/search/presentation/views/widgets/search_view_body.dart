import 'package:bookly/features/search/presentation/views/widgets/custem_text_field.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          CustemTextField(hintText: "Search for book..", isPassword: false),
          SearchResultListView(),
        ],
      ),
    );
  }
}
