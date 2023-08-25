import 'package:blog_system_dashboard/res/styles/colors.dart';
import 'package:blog_system_dashboard/view/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false,
          primaryColor: const Color(0xff1C1C1C),
          scaffoldBackgroundColor: ConstantColors.appBackgroundColor,
          cardColor: ConstantColors.dashboardCardsColor),
      home: const LoginView(),
    );
  }
}
