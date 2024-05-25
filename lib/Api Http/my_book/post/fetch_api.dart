import 'dart:convert';

import 'package:readify/Api%20Http/my%20favourites/post/model.dart';
import 'package:http/http.dart' as http;
import 'package:readify/Api%20Http/my_book/post/model.dart';
import 'package:readify/Constants.dart';

class PostMyBookResult {
  bool? hasData;
  String? massage;
  PostMyBookModel? postMyBookModel;
}

class PostMyBookFetchApi {
  static Future<PostMyBookResult> fetchData({required int id}) async {
    final _url = Uri.parse('${Constants.myBooks}/add/$id');

    PostMyBookResult postMyBookResult = PostMyBookResult();
    try {
      final response = await http.post(
        _url,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );
      print('Post My Book response statusCode : ${response.statusCode}');
      if (response.statusCode == 200) {
        postMyBookResult.hasData = true;
        postMyBookResult.massage = 'post done';
        postMyBookResult.postMyBookModel =
            PostMyBookModel.fromJson(jsonDecode(response.body));
        return postMyBookResult;
      } else {
        postMyBookResult.hasData = false;
        postMyBookResult.massage = 'post failed';
        return postMyBookResult;
      }
    } catch (e) {
      postMyBookResult.hasData = false;
      postMyBookResult.massage = 'post done catch error :$e';
      throw Exception('catch post error : $e');
    }
  }
}
