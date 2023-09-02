import 'dart:convert';

import 'package:blog_system_dashboard/view_model/login_view_mode.dart';

class ApiConstants {
  final LoginViewModel provider = LoginViewModel();
  static const String baseUrl = "http://localhost:3000";
  static final Uri loginUser = Uri.parse("$baseUrl/user/login");
  static final Uri signUp = Uri.parse("$baseUrl/user/signUp");
  static final Uri getPosts = Uri.parse("$baseUrl/posts");
  static final createPost = Uri.parse("$baseUrl/posts");
  static const String updatePost = "$baseUrl/posts"; // passing id in view model
  static final Uri getCategories = Uri.parse("$baseUrl/category");
  static final Uri createCategory = Uri.parse("$baseUrl/category");

  static final headerWithOutToken = {'Content-Type': 'application/json'};

  static Map<String, String> getheaderWithToken(String token) {
    return <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${jsonDecode(token)}',
    };
  }
}
