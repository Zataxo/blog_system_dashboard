import 'dart:convert';
import 'dart:developer';

import 'package:blog_system_dashboard/api/api_costants.dart';
import 'package:blog_system_dashboard/model/user_model.dart';
import 'package:blog_system_dashboard/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginViewModel extends ChangeNotifier {
  UserModel? globalUserModel;
  bool isLoginOrRegister = true;
  LoadingState globalState = LoadingState.intial;
  String? userToken;
  void setLoadingState(LoadingState state) {
    globalState = state;
    notifyListeners();
  }

  void switchLoginForm() {
    isLoginOrRegister = !isLoginOrRegister;
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

      setLoadingState(LoadingState.intial);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signUp(String username, String email, String password) async {
    setLoadingState(LoadingState.loading);
    final requestBody =
        jsonEncode({"name": username, "email": email, "password": password});
    try {
      final response = await http.post(ApiConstants.signUp,
          body: requestBody, headers: ApiConstants.headerWithOutToken);
      print(response.statusCode);
      print(response.body);
      setLoadingState(LoadingState.loaded);

      setLoadingState(LoadingState.intial);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  void setUserModel(UserModel userModel) {
    globalUserModel = userModel;
    // print(userModel.id);
    notifyListeners();
  }

  void setUserToken(String token) {
    userToken = token;
    notifyListeners();
    print(userToken);
  }
}
