import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadignData extends StatefulWidget {
  const LoadignData({super.key});

  @override
  State<LoadignData> createState() => _LoadignDataState();
}

class _LoadignDataState extends State<LoadignData> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.hexagonDots(
        color: const Color(0xffFF6A64).withOpacity(0.7),
        // color: Colors.white,
        size: 100,
      ),
    );
  }
}
