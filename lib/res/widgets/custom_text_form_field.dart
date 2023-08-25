import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.hintTextStyle,
      required this.icon});
  final TextEditingController controller;
  final String hintText;
  final TextStyle hintTextStyle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffF0EDFF),
          borderRadius: BorderRadius.circular(10)),
      width: size.width * 0.2,
      child: TextFormField(
        validator: (value) {
          if (value != null || value == "") {
            return "";
          }
          return "";
        },
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(10),
            //   borderSide: const BorderSide(
            //     width: 1,
            //     color: Color(0xffFFB199),
            //   ),
            // ),
            // errorBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(10),
            //     borderSide: const BorderSide(
            //       width: 1,
            //       color: Colors.red,
            //     )),
            // enabledBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(10),
            //     borderSide: const BorderSide(
            //       width: 1,
            //       color: Color(0xffFFB199),
            //     )),
            hintText: hintText,
            hintStyle: hintTextStyle,
            prefixIcon: Icon(
              icon,
              color: const Color(0xff1C1C1C),
            )),
      ),
    );
  }
}