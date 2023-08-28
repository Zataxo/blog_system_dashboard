import 'package:blog_system_dashboard/res/constants/dashboard_view_const.dart';
import 'package:blog_system_dashboard/res/widgets/category_chart.dart';
import 'package:blog_system_dashboard/res/widgets/header.dart';
import 'package:blog_system_dashboard/view_model/category_view_model.dart';
import 'package:blog_system_dashboard/view_model/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  List<int> totals = [];
  @override
  Widget build(BuildContext context) {
    int totalPost = context.watch<PostsViewModel>().getPosts().length;
    int totalCategories =
        context.watch<CategoryViewModel>().getCategories().length;
    totals = [totalPost, totalCategories, 1];
    return Column(
      children: [
        const Expanded(
            flex: 2,
            child: Header(
              title: "Dashboard",
            )),
        Expanded(flex: 3, child: _buildSecondSection(context)),
        Expanded(flex: 5, child: _buildThirdSection()),
      ],
    );
  }

  Widget _buildThirdSection() {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            // color: Colors.red,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Most View Category",
                              style: TextStyle(
                                  color: Color(0xff333333),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Overall Information",
                              style: TextStyle(
                                  color:
                                      const Color(0xff333333).withOpacity(0.5)),
                            ),
                          ],
                        ),
                        // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
                        Column(
                          children: [
                            ToggleSwitch(
                              initialLabelIndex: 0,
                              totalSwitches: 2,
                              activeBgColor: const [
                                Color(0xffFF6A64),
                                Color(0xffFFB199)
                              ],
                              inactiveBgColor: Colors.transparent,
                              radiusStyle: true,
                              labels: const ['Monthly', 'Yearly'],
                              onToggle: (index) {
                                // print('switched to: $index');
                              },
                            ),
                          ],
                        ),
                      ],
                    )),
                Expanded(
                    flex: 7,
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const CategoriesChart())),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            // color: Colors.blue,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffFF6A64).withOpacity(0.1)),
                        child: const Center(
                          child: Text(
                            "Latest Post",
                            style: TextStyle(
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                ),
                Expanded(
                    flex: 8,
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 5,
                            ),
                        itemCount: 5,
                        itemBuilder: (context, index) => _buildLatestPosts()))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLatestPosts() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "The Power of Dream",
            style: TextStyle(
                color: Color(0xff333333), fontWeight: FontWeight.w500),
          ),
          Text(
            "28 June 2021",
            style: TextStyle(color: const Color(0xff333333).withOpacity(0.5)),
          )
        ],
      ),
    );
  }

  Widget _buildSecondSection(BuildContext ctx) {
    // int totalUsers = ctx.watch<UserModel>().getCategories().length;
    return Container(
        // color: Colors.green,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => _buildCards(
                        totals[index],
                        DashboardConsts.titles[index],
                        DashboardConsts.mainIcons[index],
                        ctx,
                        index),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: DashboardConsts.mainIcons.length))
          ],
        ));
  }

  Widget _buildCards(
      int total, String title, String svgName, BuildContext ctx, int indx) {
    final size = MediaQuery.of(ctx).size;
    return MouseRegion(
      onEnter: (event) {
        DashboardConsts.onHoverItem = true;
        DashboardConsts.selectedItem = indx;
        setState(() {});
      },
      onExit: (event) {
        DashboardConsts.onHoverItem = false;

        setState(() {});
      },
      child: Material(
        shadowColor: const Color(0xffFF6A64),
        elevation:
            DashboardConsts.onHoverItem && indx == DashboardConsts.selectedItem
                ? 5
                : 0,
        borderRadius: BorderRadius.circular(20),
        animationDuration: const Duration(seconds: 2),
        child: Container(
          width: size.width * 0.22,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color(0xffFF6A64).withOpacity(0.1),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Color(0xff333333), fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      total.toString(),
                      style: const TextStyle(
                          color: Color(0xffFF6A64), fontSize: 16),
                    ),
                  )
                ],
              ),
              SvgPicture.asset("assets/icons/$svgName.svg")
            ],
          ),
        ),
      ),
    );
  }
}
