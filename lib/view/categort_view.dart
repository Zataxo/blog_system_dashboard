import 'package:blog_system_dashboard/res/tables/category_table.dart';
import 'package:blog_system_dashboard/res/widgets/header.dart';
import 'package:blog_system_dashboard/res/widgets/search_box.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
            flex: 2,
            child: Header(
              title: "Category",
            )),
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: SearchBox(
                controller: _search,
                hintText: "Search",
                hintTextStyle:
                    TextStyle(color: const Color(0xff333333).withOpacity(0.5)),
                icon: Icons.search_outlined,
                validator: (String? v) => v == null || v.isEmpty ? "" : null,
              ),
            )),
        Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: const CategoryTable(),
            ))
      ],
    );
  }
}
