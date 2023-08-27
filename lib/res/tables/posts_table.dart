import 'package:blog_system_dashboard/model/post_model.dart';
import 'package:blog_system_dashboard/res/dialogs/new_post_dialog.dart';
import 'package:blog_system_dashboard/res/models/pop_menu_model.dart';
import 'package:blog_system_dashboard/res/widgets/custom_pop_menu.dart';
import 'package:flutter/material.dart';

class PostsTable extends StatelessWidget {
  const PostsTable({
    super.key,
    required this.postsList,
  });
  final List<PostModel> postsList;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DataTable(
              columnSpacing: 100,
              columns: const [
                DataColumn(label: Text("*")),
                DataColumn(label: Text("Post ID")),
                DataColumn(label: Text("Title")),
                DataColumn(label: Text("User")),
                DataColumn(label: Text("Category")),
                DataColumn(label: Text("")),
                // DataColumn(label: Text("Title")),
              ],
              rows: List.generate(postsList.length,
                  (index) => postRow(index, postsList[index], context))),
        ],
      ),
    );
  }

  DataRow postRow(int indx, PostModel post, BuildContext ctx) {
    return DataRow(cells: [
      DataCell(Text(indx.toString())),
      DataCell(Text(post.id.toString())),
      DataCell(Text(post.title)),
      DataCell(Text(post.user.name)),
      DataCell(Text(post.content)),
      DataCell(CustomPopMenu(popMenuModel: optionList(ctx))),
    ]);
  }

  List<PopMenuModel> optionList(BuildContext ctx) {
    List<PopMenuModel> list = [];
    list.add(PopMenuModel(
        icon: Icons.add_outlined,
        desc: "Update Post",
        onPressed: () => showDialog(
            context: ctx, builder: (context) => const NewPostDialog())));
    list.add(PopMenuModel(
        icon: Icons.book_online_outlined,
        desc: "Post Deatails",
        onPressed: () => print("")));
    return list;
  }
}
