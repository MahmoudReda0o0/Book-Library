import 'dart:convert';

import 'package:readify/Api%20Http/my%20favourites/get/model.dart';
import 'package:readify/Api%20Http/my_book/get/mode.dart';
import 'package:readify/Constants.dart';
import 'package:http/http.dart' as http;

class GetMyBookResult {
  bool? hasData;
  String? massage;
  MyBookModel? myBookModel;
}

class GetMyBookFetchApi {
  static Future<GetMyBookResult> fetchApi() async {
    final _uri = Uri.parse("${Constants.myBooks}");

    GetMyBookResult getMyBookResult = GetMyBookResult();

    try {
      final response = await http.get(
        _uri,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );
      print('My Books response Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        getMyBookResult.myBookModel =
            MyBookModel.fromJson(jsonDecode(response.body));
        getMyBookResult.hasData = true;
        getMyBookResult.massage = 'date done';
        return getMyBookResult;
      } else {
        getMyBookResult.hasData = false;
        getMyBookResult.massage = ' data Failed';
        return getMyBookResult;
      }
    } catch (e) {
      getMyBookResult.hasData = false;
      getMyBookResult.massage = 'catch error : $e';
      throw Exception('Catch Error : $e');
    }
  }
}
