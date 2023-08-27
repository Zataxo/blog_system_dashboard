import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Color(0xff333333),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Home / $title",
                    style: TextStyle(
                        color: const Color(0xff333333).withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
