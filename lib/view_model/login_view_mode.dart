import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool isLogin = true;
  void switchLoginForm() {
    isLogin = !isLogin;
    notifyListeners();
  }
}
