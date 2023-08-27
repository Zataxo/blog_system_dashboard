import 'package:blog_system_dashboard/res/dialogs/new_post_dialog.dart';
import 'package:blog_system_dashboard/res/widgets/header.dart';
import 'package:blog_system_dashboard/res/tables/posts_table.dart';
import 'package:blog_system_dashboard/res/widgets/loading_data.dart';
import 'package:blog_system_dashboard/res/widgets/search_box.dart';
import 'package:blog_system_dashboard/utils/enums.dart';
import 'package:blog_system_dashboard/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
            flex: 2,
            child: Header(
              title: "Posts",
            )),
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: SearchBox(
                      controller: _search,
                      hintText: "Search",
                      hintTextStyle: TextStyle(
                          color: const Color(0xff333333).withOpacity(0.5)),
                      icon: Icons.search_outlined,
                      validator: (String? v) =>
                          v == null || v.isEmpty ? "" : null,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () => showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => const NewPostDialog(),
                            ),
                        icon: const Icon(Icons.add_outlined)),
                  )
                ],
              ),
            )),
        Expanded(
            flex: 7,
            child: Consumer<PostsViewModel>(
              builder: (context, postsViewModel, child) =>
                  postsViewModel.globalState == LoadingState.loading
                      ? const LoadignData()
                      : Container(
                          padding: const EdgeInsets.all(20),
                          child: PostsTable(
                            postsList: postsViewModel.getPosts(),
                          ),
                        ),
            ))
      ],
    );
  }
}
