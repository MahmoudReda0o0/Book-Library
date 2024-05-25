import 'dart:convert';

import 'package:readify/Api%20Http/my%20favourites/post/model.dart';
import 'package:http/http.dart' as http;
import 'package:readify/Api%20Http/my_book/delete/model.dart';
import 'package:readify/Api%20Http/my_book/post/model.dart';
import 'package:readify/Constants.dart';

class DeleteMyBookResult {
  bool? hasData;
  String? massage;
  DeleteMyBookModel? deleteMyBookModel;
}

class DeleteMyBookFetchApi {
  static Future<DeleteMyBookResult> fetchData({required int id}) async {
    final _url = Uri.parse('${Constants.myBooks}/delete/$id');

    DeleteMyBookResult deleteMyBookResult = DeleteMyBookResult();
    try {
      final response = await http.post(
        _url,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );
      print('Delete My Book response statusCode : ${response.statusCode}');
      if (response.statusCode == 200) {
        deleteMyBookResult.hasData = true;
        deleteMyBookResult.massage = 'post done';
        deleteMyBookResult.deleteMyBookModel =
            DeleteMyBookModel.fromJson(jsonDecode(response.body));
        return deleteMyBookResult;
      } else {
        deleteMyBookResult.hasData = false;
        deleteMyBookResult.massage = 'post failed';
        return deleteMyBookResult;
      }
    } catch (e) {
      deleteMyBookResult.hasData = false;
      deleteMyBookResult.massage = 'post done catch error :$e';
      throw Exception('catch post error : $e');
    }
  }
}
