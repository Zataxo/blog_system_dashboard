import 'package:flutter/material.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: const [
      DataColumn(label: Text("*")),
      DataColumn(label: Text("Title")),
      DataColumn(label: Text("Date")),
      DataColumn(label: Text("")),
      // DataColumn(label: Text("Title")),
    ], rows: const []);
  }
}
