import 'package:blog_system_dashboard/res/constants/dashboard_view_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: const Color(0xffFF6A64).withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Expanded(flex: 2, child: _buildFirstSection()),
          Expanded(flex: 3, child: _buildSecondSection(context)),
          Expanded(flex: 5, child: _buildThirdSection()),
        ],
      ),
    );
  }

  Container _buildThirdSection() {
    return Container(
        color: Colors.blue,
        child: const Row(
          children: [],
        ));
  }

  Widget _buildSecondSection(BuildContext ctx) {
    return Container(
        // color: Colors.green,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Expanded(child: _buildCards("Posts", DashboardConsts.mainIcons[0])),
            // Expanded(
            //     child: Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //   child: _buildCards("Category", DashboardConsts.mainIcons[1]),
            // )),
            // Expanded(child: _buildCards("Users", DashboardConsts.mainIcons[2])),
            Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => _buildCards(
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

  Widget _buildCards(String title, String svgName, BuildContext ctx, int indx) {
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
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "10",
                      style: TextStyle(color: Color(0xffFF6A64), fontSize: 16),
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

  Container _buildFirstSection() {
    return Container(
        // color: Colors.red,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Dashboard",
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Home / Dashboard",
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
