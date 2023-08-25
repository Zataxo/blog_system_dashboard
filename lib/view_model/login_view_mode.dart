import 'dart:convert';
import 'dart:developer';

import 'package:blog_system_dashboard/api/api_costants.dart';
import 'package:blog_system_dashboard/model/user_model.dart';
import 'package:blog_system_dashboard/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginViewModel extends ChangeNotifier {
  UserModel? userModel;
  bool isLogin = true;
  LoadingState state = LoadingState.intial;
  String? userToken;
  void switchLoginForm() {
    isLogin = !isLogin;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    setLoadingState(LoadingState.loading);
    final requestBody = jsonEncode({"email": email, "password": password});
    try {
      final http.Response response = await http.post(
        ApiConstants.loginUser,
        body: requestBody,
        headers: ApiConstants.headerWithOutToken,
      );
      if (response.statusCode == 200) {
        setUserModel(userModelFromJson(
            jsonEncode(jsonDecode(response.body)["userModel"])));
        setUserToken(jsonEncode(jsonDecode(response.body)["token"]));
      }
      setLoadingState(LoadingState.loaded);

      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
    setLoadingState(LoadingState.intial);
  }

  void setUserModel(UserModel userModel) {
    userModel = userModel;
    // print(userModel.id);
  }

  void setLoadingState(LoadingState state) {
    state = state;
    notifyListeners();
  }

  void setUserToken(String token) {
    userToken = token;
    print(userToken);
  }
}
