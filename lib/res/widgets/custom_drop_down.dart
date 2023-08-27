import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.items,
    required this.onChange,
    required this.hintText,
    required this.hintTextStyle,
    required this.value,
  });
  final List<DropdownMenuItem> items;
  final Function(dynamic) onChange;
  final String hintText;
  final String value;

  final TextStyle hintTextStyle;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffF0EDFF),
          borderRadius: BorderRadius.circular(10)),
      width: size.width * 0.2,
      child: DropdownButton(
        alignment: Alignment.center,
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        // underline: null,
        hint: Text(
          hintText,
          style: hintTextStyle,
        ),
        isExpanded: true,

        // autofocus: true,
        enableFeedback: true,
        value: value,
        items: items,
        onChanged: onChange,
      ),
    );
  }
}
