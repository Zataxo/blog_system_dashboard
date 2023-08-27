import 'package:blog_system_dashboard/res/styles/colors.dart';
import 'package:blog_system_dashboard/view/login_view.dart';
import 'package:blog_system_dashboard/view_model/category_view_model.dart';
import 'package:blog_system_dashboard/view_model/login_view_mode.dart';
import 'package:blog_system_dashboard/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostsViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: false,
            primaryColor: const Color(0xff1C1C1C),
            scaffoldBackgroundColor: ConstantColors.appBackgroundColor,
            cardColor: ConstantColors.dashboardCardsColor),
        home: const LoginView(),
      ),
    );
  }
}
