import 'package:blog_system_dashboard/model/category_model.dart';
import 'package:blog_system_dashboard/res/models/pop_menu_model.dart';
import 'package:blog_system_dashboard/res/widgets/custom_pop_menu.dart';
import 'package:flutter/material.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({
    super.key,
    required this.categoriesList,
  });
  final List<CategoryModel> categoriesList;

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columnSpacing: 100,
        columns: const [
          DataColumn(label: Text("*")),
          DataColumn(label: Text("Title")),
          DataColumn(label: Text("Date")),
          DataColumn(label: Text("")),
          // DataColumn(label: Text("Title")),
        ],
        rows: List.generate(categoriesList.length,
            (index) => categoryRow(index, categoriesList[index], context)));
  }

  DataRow categoryRow(int indx, CategoryModel categoryModel, BuildContext ctx) {
    return DataRow(cells: [
      DataCell(Text(indx.toString())),
      DataCell(Text(categoryModel.name)),
      DataCell(Text(categoryModel.createdAt.toString().split(" ")[0])),
      DataCell(CustomPopMenu(popMenuModel: optionList(ctx)))
    ]);
  }

  List<PopMenuModel> optionList(BuildContext ctx) {
    List<PopMenuModel> list = [];
    list.add(PopMenuModel(
        icon: Icons.add_outlined,
        desc: "New Category",
        onPressed: () => print("")));
    list.add(PopMenuModel(
        icon: Icons.book_online_outlined,
        desc: "Update Category",
        onPressed: () => print("")));
    return list;
  }
}
