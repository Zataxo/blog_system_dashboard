import 'package:blog_system_dashboard/view/categort_view.dart';
import 'package:blog_system_dashboard/view/dashboard_view.dart';
import 'package:blog_system_dashboard/view/post_view.dart';
import 'package:flutter/material.dart';

class HomeTabControllerConsts {
  static const sideMenuList = ["Dashboard", "Posts", "Categories"];
  static const List<Widget> screeList = [
    DashboardView(),
    PostView(),
    CategoryView()
  ];
  static int selectedItem = 0;
}
