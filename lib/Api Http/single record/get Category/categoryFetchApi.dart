import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:readify/Api%20Http/single%20record/get%20Category/categoryModel.dart';
import 'package:readify/Constants.dart';

class CategoryApiResult {
  bool? hasData;
  bool? catchError;
  String? message;
  CategoryModel? categoryModel;
}

class CategoryFetchApi {
  static Future<CategoryApiResult> fetchApi(String categorySlug) async {
    final _url = Uri.parse('http://127.0.0.1:8000/api/category/$categorySlug');
    CategoryApiResult categoryApiResult = CategoryApiResult();
    try {
      print('Get category Url:${_url}');
      final response = await http.get(
        _url,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );

      if (response.statusCode == 200) {
        categoryApiResult.hasData = true;
        categoryApiResult.message = 'Book Data is recived';
        categoryApiResult.categoryModel =
            CategoryModel.fromJson(jsonDecode(response.body));
        //print(categoryApiResult.bookModel!.data!.category!);
        return categoryApiResult;
      } else {
        print('else error StatusCode : ${response.statusCode}');
        categoryApiResult.hasData = false;
        categoryApiResult.message = 'Book Data is Failed';
        return categoryApiResult;
      }
    } catch (e) {
      categoryApiResult.catchError = true;
      categoryApiResult.message = 'Catch Error $e';
      return throw Exception('Git Book Catch Error : $e');
    }
  }
}
