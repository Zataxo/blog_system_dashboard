import 'package:flutter/material.dart';

class PostsTable extends StatelessWidget {
  const PostsTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(columns: const [
      DataColumn(label: Text("*")),
      DataColumn(label: Text("Post ID")),
      DataColumn(label: Text("Title")),
      DataColumn(label: Text("User")),
      DataColumn(label: Text("Category")),
      DataColumn(label: Text("")),
      // DataColumn(label: Text("Title")),
    ], rows: const []);
  }
}
