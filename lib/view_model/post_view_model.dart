import 'dart:convert';
import 'dart:developer';

import 'package:blog_system_dashboard/api/api_costants.dart';
import 'package:blog_system_dashboard/model/post_model.dart';
import 'package:blog_system_dashboard/utils/enums.dart';
import 'package:blog_system_dashboard/utils/status_codes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostsViewModel extends ChangeNotifier {
  List<PostModel> _postList = [];
  List<PostModel> _fileredList = [];
  LoadingState globalState = LoadingState.intial;
  PostsViewModel() {
    fetchPosts();
  }
  void setLoadingState(LoadingState state) {
    globalState = state;
    notifyListeners();
  }

  Future<void> fetchPosts() async {
    setLoadingState(LoadingState.loading);

    try {
      final http.Response response = await http.get(ApiConstants.getPosts,
          headers: ApiConstants.headerWithOutToken);
      if (response.statusCode == StatusCode.successfulResponse) {
        // print(response.statusCode);
        // print(response.body);
        _setPostList(postModelFromJson(response.body));
        setLoadingState(LoadingState.loaded);
        setLoadingState(LoadingState.intial);
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void _setPostList(List<PostModel> listOfModelFromJson) {
    _postList = listOfModelFromJson;
    _fileredList = _postList;
    print(_fileredList);

    notifyListeners();
  }

  List<PostModel> getPosts() {
    try {
      return _fileredList;
    } catch (e) {
      return [];
    }
  }

  Future<void> createPost(Map<String, dynamic> post) async {
    setLoadingState(LoadingState.loading);
    try {
      final http.Response response = await http.post(ApiConstants.createPost,
          body: jsonEncode(post), headers: ApiConstants.headerWithOutToken);
      print(response.statusCode);
      setLoadingState(LoadingState.loaded);
      setLoadingState(LoadingState.intial);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  List<DropdownMenuItem<String>> getPostsAsString() {
    List<DropdownMenuItem<String>> list = [];
    list.add(const DropdownMenuItem(value: "Post", child: Text("Post")));
    List<String> listAsString = _fileredList.map((e) => e.title).toList();

    for (int item = 0; item < listAsString.length; item++) {
      list.add(DropdownMenuItem(
          value: listAsString[item], child: Text(listAsString[item])));
    }
    return list;
  }

  int getMostCategoryPost(int categoryId) {
    return _fileredList
        .where((element) => element.categoryId == categoryId)
        .length;
  }
}
