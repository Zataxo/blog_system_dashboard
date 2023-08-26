import 'package:blog_system_dashboard/res/constants/homt_tab_controllers_const.dart';
import 'package:blog_system_dashboard/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTapControllerView extends StatefulWidget {
  const HomeTapControllerView({super.key});

  @override
  State<HomeTapControllerView> createState() => _HomeTapControllerViewState();
}

class _HomeTapControllerViewState extends State<HomeTapControllerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  elevation: 5,
                  child: Container(
                    // color: Colors.red,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                            colors: [Color(0xffFF6A64), Color(0xffFFB199)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "MY BLOG",
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              RotatedBox(
                                quarterTurns: 90,
                                child: IconButton(
                                    onPressed: () =>
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginView(),
                                            ),
                                            (route) => false),
                                    icon: const Icon(
                                      Icons.logout_outlined,
                                      color: Color(0xffFFFFFF),
                                    )),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: ListView.separated(
                            itemBuilder: (context, index) =>
                                _buildSideMenu(index),
                            itemCount:
                                HomeTabControllerConsts.sideMenuList.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 5,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: _buildUserGuid(),
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              _buildUserPhotoHolder(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Hassan Ismat",
                                    style: TextStyle(
                                        color: Color(0xff333333),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Software Engineer",
                                    style: TextStyle(
                                        color: const Color(0xff333333)
                                            .withOpacity(0.5)),
                                  ),
                                ],
                              )
                            ],
                          )),
                      Expanded(
                          flex: 9,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: HomeTabControllerConsts.screeList[
                                HomeTabControllerConsts.selectedItem],
                          )),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Container _buildUserGuid() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color(0xffFFFFFF).withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //svg
          SvgPicture.asset("assets/icons/user_guid.svg"),

          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User Guid",
                style: TextStyle(color: Color(0xffFFFFFF)),
              ),
              Text(
                "Documentation",
                style: TextStyle(color: Color(0xffFFFFFF)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildUserPhotoHolder() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/imgs/r1.png"),
        ),
      );

  Widget _buildSideMenu(int index) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        HomeTabControllerConsts.selectedItem = index;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: size.height * 0.07,
        width: size.width * 0.05,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: HomeTabControllerConsts.selectedItem == index
                ? const Color(0xffFFFFFF).withOpacity(0.12)
                : null),
        child: Row(
          children: [
            Text(
              HomeTabControllerConsts.sideMenuList[index],
              style: TextStyle(
                  color: const Color(0xffFFFFFF),
                  fontWeight: HomeTabControllerConsts.selectedItem == index
                      ? FontWeight.bold
                      : null),
            ),
          ],
        ),
      ),
    );
  }
}
