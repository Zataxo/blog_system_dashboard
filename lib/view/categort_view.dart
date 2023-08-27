import 'package:blog_system_dashboard/res/tables/category_table.dart';
import 'package:blog_system_dashboard/res/widgets/header.dart';
import 'package:blog_system_dashboard/res/widgets/loading_data.dart';
import 'package:blog_system_dashboard/res/widgets/search_box.dart';
import 'package:blog_system_dashboard/utils/enums.dart';
import 'package:blog_system_dashboard/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              child: Consumer<CategoryViewModel>(
                  builder: (context, categoryViewModel, child) =>
                      categoryViewModel.globalState == LoadingState.loading
                          ? const LoadignData()
                          : CategoryTable(
                              categoriesList: categoryViewModel.getCategories(),
                            )),
            ))
      ],
    );
  }
}
