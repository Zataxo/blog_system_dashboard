import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.titleStyle,
      this.buttonColor});
  final Function() onPressed;
  final String title;
  final TextStyle titleStyle;
  final Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: size.width * 0.2,
        height: size.height * 0.07,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: buttonColor != null
              ? null
              : const LinearGradient(
                  colors: [Color(0xffFF9A88), Color(0xffFF6A64)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
        ),
        child: Center(
          child: Text(
            title,
            style: titleStyle,
          ),
        ),
      ),
    );
  }
}
