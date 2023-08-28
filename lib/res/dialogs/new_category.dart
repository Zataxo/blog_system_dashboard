import 'package:blog_system_dashboard/model/category_model.dart';
import 'package:blog_system_dashboard/res/widgets/custom_button.dart';
import 'package:blog_system_dashboard/res/widgets/custom_text_form_field.dart';
import 'package:blog_system_dashboard/res/widgets/loading_data.dart';
import 'package:blog_system_dashboard/utils/enums.dart';
import 'package:blog_system_dashboard/view_model/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewCategoryDialog extends StatefulWidget {
  const NewCategoryDialog({
    super.key,
  });

  @override
  State<NewCategoryDialog> createState() => _NewCategoryDialogState();
}

class _NewCategoryDialogState extends State<NewCategoryDialog> {
  final _title = TextEditingController();
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
                    width: size.width * 0.3,
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.all(20),
                    child: _buildNewCategoryDialog(context),
                  ),
      ),
    );
  }

  Widget _buildNewCategoryDialog(BuildContext context) {
    return Form(
      key: _newPostFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "New Category",
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
          CustomTextFormField(
            controller: _title,
            hintText: "Category Title",
            hintTextStyle:
                TextStyle(color: const Color(0xff333333).withOpacity(0.5)),
            icon: Icons.title_outlined,
            validator: (String? v) => v == null || v.isEmpty ? "" : null,
          ),
          Consumer<CategoryViewModel>(
            builder: (context, categoryViewModel, child) => CustomButtom(
              onPressed: () async {
                if (_newPostFormKey.currentState!.validate()) {
                  // print(_category.text);
                  await categoryViewModel.createCategory(
                      CategoryModel.newCategory(name: _title.text.trim()));
                  await categoryViewModel.fetchCategory();
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
          )
        ],
      ),
    );
  }

  void _clearing() {
    _title.clear();
  }
}
