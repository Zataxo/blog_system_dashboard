import 'package:blog_system_dashboard/res/widgets/custom_button.dart';
import 'package:blog_system_dashboard/res/widgets/custom_text_form_field.dart';
import 'package:blog_system_dashboard/view/home_tab_controller_view.dart';
import 'package:blog_system_dashboard/view_model/login_view_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Row(
          children: [
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFF9A88).withOpacity(.1),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            bottomLeft: Radius.circular(24))),
                    child: Center(
                        child:
                            // context.watch<LoginViewModel>().isLogin
                            //     ?
                            _buildLoginForm()
                        // : _buildRegistrationForm(),
                        ))),
            Expanded(
                child: MouseRegion(
              onHover: (event) {
                context.read<LoginViewModel>().switchLoginForm();
                // print(context.read<LoginViewModel>().isLogin);
              },
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      gradient: LinearGradient(
                          colors: [Color(0xffFF7D72), Color(0xffFF7B71)],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight)),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Image.asset("assets/imgs/login_img.png"))
                    ],
                  )),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Login",
            style: TextStyle(
                color: Color(0xff000000),
                fontWeight: FontWeight.bold,
                fontSize: 22),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Please fill the form..",
              style: TextStyle(
                  color: Color(0xff000000),
                  // fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: CustomTextFormField(
              isPassword: false,
              validator: (String? value) =>
                  value == null || value.isEmpty ? "" : null,
              controller: email,
              hintText: "Email",
              icon: Icons.email_outlined,
              hintTextStyle: const TextStyle(color: Color(0xff1C1C1C)),
            ),
          ),
          CustomTextFormField(
            isPassword: true,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "";
              } else {
                return null;
              }
            },
            controller: password,
            hintText: "Password",
            icon: Icons.lock_clock_outlined,
            hintTextStyle: const TextStyle(color: Color(0xff1C1C1C)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.0),
            child: Consumer<LoginViewModel>(
              builder: (context, loginViewModel, child) => CustomButtom(
                  state: loginViewModel.globalState,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await loginViewModel.login(
                          email.text.trim(), password.text.trim());
                      print(loginViewModel.globalUserModel);
                      print(loginViewModel.userToken);

                      navigateAfterSuccess();
                    }
                  },
                  title: "Login",
                  titleStyle: const TextStyle(color: Color(0xffFFFFFF))),
            ),
          ),
        ],
      ),
    );
  }

  void navigateAfterSuccess() {
    if (context.read<LoginViewModel>().globalUserModel != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeTapControllerView(),
          ));
    }
  }

  // Widget _buildRegistrationForm() {
  //   return Form(
  //     key: _formKey,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const Text(
  //           "Sign Up",
  //           style: TextStyle(
  //               color: Color(0xff000000),
  //               fontWeight: FontWeight.bold,
  //               fontSize: 22),
  //         ),
  //         const Padding(
  //           padding: EdgeInsets.symmetric(vertical: 8.0),
  //           child: Text(
  //             "Please fill the form..",
  //             style: TextStyle(
  //                 color: Color(0xff000000),
  //                 // fontWeight: FontWeight.bold,
  //                 fontSize: 14),
  //           ),
  //         ),
  //         CustomTextFormField(
  //           controller: username,
  //           hintText: "Username",
  //           validator: (value) {
  //             if (value == null || value == "") {
  //               return "";
  //             } else {
  //               return value;
  //             }
  //           },
  //           icon: Icons.man_3_outlined,
  //           hintTextStyle: const TextStyle(color: Color(0xff1C1C1C)),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 8.0),
  //           child: CustomTextFormField(
  //             validator: (value) {
  //               if (value == null || value == "") {
  //                 return "";
  //               } else {
  //                 return value;
  //               }
  //             },
  //             controller: email,
  //             hintText: "Email",
  //             icon: Icons.email_outlined,
  //             hintTextStyle: const TextStyle(color: Color(0xff1C1C1C)),
  //           ),
  //         ),
  //         CustomTextFormField(
  //           validator: (value) {
  //             if (value == null || value == "") {
  //               return "";
  //             } else {
  //               return value;
  //             }
  //           },
  //           controller: password,
  //           hintText: "Password",
  //           icon: Icons.lock_clock_outlined,
  //           hintTextStyle: const TextStyle(color: Color(0xff1C1C1C)),
  //         ),
  //         CustomButtom(
  //             buttonColor: const Color(0xffFFFFFF),
  //             onPressed: () {
  //               // print("object");
  //               if (_formKey.currentState!.validate()) {}
  //             },
  //             title: "Sign Up",
  //             titleStyle: const TextStyle(fontWeight: FontWeight.bold)),
  //       ],
  //     ),
  //   );
  // }
}
