import 'package:blog_system_dashboard/model/post_model.dart';
import 'package:blog_system_dashboard/res/widgets/custom_button.dart';
import 'package:blog_system_dashboard/res/widgets/custom_drop_down.dart';
import 'package:blog_system_dashboard/res/widgets/custom_text_form_field.dart';
import 'package:blog_system_dashboard/res/widgets/loading_data.dart';
import 'package:blog_system_dashboard/utils/enums.dart';
import 'package:blog_system_dashboard/view_model/category_view_model.dart';
import 'package:blog_system_dashboard/view_model/login_view_mode.dart';
import 'package:blog_system_dashboard/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPostDialog extends StatefulWidget {
  const NewPostDialog({
    super.key,
  });

  @override
  State<NewPostDialog> createState() => _NewPostDialogState();
}

class _NewPostDialogState extends State<NewPostDialog> {
  final _title = TextEditingController();
  final TextEditingController _category =
      TextEditingController(text: "Category");
  final _content = TextEditingController();
  final _newPostFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Consumer<CategoryViewModel>(
        builder: (context, categoryViewModel, child) =>
            categoryViewModel.globalState == LoadingState.loading
                ? const LoadignData()
                : Container(
                    width: size.width * 0.5,
                    height: size.height * 0.5,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(20),
                    child: _buildNewPostForm(context),
                  ),
      ),
    );
  }

  Widget _buildNewPostForm(BuildContext context) {
    return Form(
      key: _newPostFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "New Post",
                style: TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_outlined))
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextFormField(
                controller: _title,
                hintText: "Post Title",
                hintTextStyle:
                    TextStyle(color: const Color(0xff333333).withOpacity(0.5)),
                icon: Icons.title_outlined,
                validator: (String? v) => v == null || v.isEmpty ? "" : null,
              ),
              Selector<CategoryViewModel, List<DropdownMenuItem<String>>>(
                  selector: (context, listenTo) =>
                      listenTo.getCategoriesNames(),
                  builder: (context, items, child) {
                    // _category.text =
                    //     items.map((e) => e.value).toList()[0].toString();
                    return CustomDropDown(
                      items: items,
                      value: _category.text,
                      hintText: "Category",
                      hintTextStyle: const TextStyle(color: Color(0xff333333)),
                      onChange: (value) {
                        if (value != null) {
                          _category.text = value;
                          // print(_category.text);
                          setState(() {});
                        }
                      },
                    );
                  })
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                CustomTextFormField(
                  controller: _content,
                  isRichBox: true,
                  hintText: "Content",
                  hintTextStyle: TextStyle(
                      color: const Color(0xff333333).withOpacity(0.5)),
                  icon: Icons.content_copy,
                  validator: (String? v) => v == null || v.isEmpty ? "" : null,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<PostsViewModel>(
                builder: (context, postsViewModel, child) => CustomButtom(
                  onPressed: () async {
                    if (_newPostFormKey.currentState!.validate()) {
                      await postsViewModel.createPost(PostModel.newPost(
                          title: _title.text.trim(),
                          content: _content.text.trim(),
                          userId: context
                              .read<LoginViewModel>()
                              .globalUserModel!
                              .id,
                          categoryId: context
                              .read<CategoryViewModel>()
                              .getCategoryIdByName(
                                  _category.text.toLowerCase().trim())));
                      await postsViewModel.fetchPosts();
                      // print(_category.text);
                      _clearing();
                    }
                  },
                  title: "Confirm",
                  titleStyle: const TextStyle(color: Color(0xffFFFFFF)),
                ),
              ),
              CustomButtom(
                onPressed: () => Navigator.pop(context),
                title: "Cancel",
                buttonColor: const Color(0x00333333).withOpacity(0.5),
                titleStyle: const TextStyle(color: Color(0xffFFFFFF)),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _clearing() {
    _category.text = "Category";
    _content.clear();
    _title.clear();
  }
}
