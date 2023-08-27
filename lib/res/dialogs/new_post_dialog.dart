import 'package:blog_system_dashboard/res/widgets/custom_button.dart';
import 'package:blog_system_dashboard/res/widgets/custom_drop_down.dart';
import 'package:blog_system_dashboard/res/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: size.width * 0.5,
        height: size.height * 0.5,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(20),
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
                  hintTextStyle: TextStyle(
                      color: const Color(0xff333333).withOpacity(0.5)),
                  icon: Icons.title_outlined,
                  validator: (String? v) => v == null || v.isEmpty ? "" : null,
                ),
                CustomDropDown(
                  items: getList,
                  value: _category.text.trim(),
                  hintText: "Category",
                  hintTextStyle: const TextStyle(color: Color(0xff333333)),
                  onChange: (value) {
                    if (value != null) {
                      _category.text = value;
                      print(_category.text);
                      print(value);
                      setState(() {});
                    }
                  },
                )
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
                    validator: (String? v) =>
                        v == null || v.isEmpty ? "" : null,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButtom(
                  onPressed: () {},
                  title: "Confirm",
                  titleStyle: const TextStyle(color: Color(0xffFFFFFF)),
                ),
                CustomButtom(
                  onPressed: () {},
                  title: "Cancel",
                  buttonColor: const Color(0x00333333).withOpacity(0.5),
                  titleStyle: const TextStyle(color: Color(0xffFFFFFF)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // List<DropdownMenuItem> getList(){}
  List<DropdownMenuItem<String>> get getList => [
        const DropdownMenuItem(value: "Category", child: Text("Category")),
        const DropdownMenuItem(value: "Data", child: Text("data")),
        const DropdownMenuItem(value: "Row1", child: Text("Row1")),
        // const DropdownMenuItem(child: Text("Hello"))
      ];
}
