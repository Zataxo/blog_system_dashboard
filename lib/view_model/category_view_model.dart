import 'dart:convert';
import 'dart:developer';

import 'package:blog_system_dashboard/api/api_costants.dart';
import 'package:blog_system_dashboard/model/category_model.dart';
import 'package:blog_system_dashboard/utils/enums.dart';
import 'package:blog_system_dashboard/utils/status_codes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryViewModel extends ChangeNotifier {
  List<CategoryModel> _categoryList = [];
  List<CategoryModel> _fileredList = [];
  LoadingState globalState = LoadingState.intial;
  CategoryViewModel() {
    fetchCategory();
  }
  void setLoadingState(LoadingState state) {
    globalState = state;
    notifyListeners();
  }

  Future<void> fetchCategory() async {
    setLoadingState(LoadingState.loading);
    try {
      final http.Response response = await http.get(ApiConstants.getCategories);
      if (response.statusCode == StatusCode.successfulResponse) {
        _setCategoryList(categoryModelFromJson(response.body));
      }
      setLoadingState(LoadingState.loaded);
      setLoadingState(LoadingState.intial);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  void _setCategoryList(List<CategoryModel> listOfModelFromJson) {
    _categoryList = listOfModelFromJson;
    _fileredList = _categoryList;
    notifyListeners();
  }

  List<CategoryModel> getCategories() {
    try {
      return _fileredList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> createCategory(Map<String, dynamic> newCategory) async {
    setLoadingState(LoadingState.loading);
    try {
      final http.Response response = await http.post(
          ApiConstants.createCategory,
          headers: ApiConstants.headerWithOutToken,
          body: jsonEncode(newCategory));
      if (response.statusCode == StatusCode.successfulCreation) {
        print(response.body);
      } else {
        print(response.statusCode);
      }

      setLoadingState(LoadingState.loaded);
      setLoadingState(LoadingState.intial);
    } catch (e) {
      print(e.toString());
    }
  }

  List<DropdownMenuItem<String>> getCategoriesNames() {
    List<DropdownMenuItem<String>> list = [];
    list.add(
        const DropdownMenuItem(value: "Category", child: Text("Category")));
    List<String> listAsString = _fileredList.map((e) => e.name).toList();

    for (int item = 0; item < listAsString.length; item++) {
      list.add(DropdownMenuItem(
          value: listAsString[item], child: Text(listAsString[item])));
    }
    return list;
  }

  int getCategoryIdByName(String categoryName) {
    try {
      return _fileredList
          .firstWhere((element) => element.name.toLowerCase() == categoryName)
          .id;
    } catch (e) {
      return 0;
    }
  }
}
