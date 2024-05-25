import 'dart:convert';

import 'package:readify/Api%20Http/my%20favourites/post/model.dart';
import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';

class PostMyFavouritesResult {
  bool? hasData;
  String? massage;
  PostMyFavouritesModel? postMyFavouritesModel;
}

class PostMyFavouritesFetchApi {
  static Future<PostMyFavouritesResult> fetchData({required int id}) async {
    final _url = Uri.parse('${Constants.myFavorites}/add/$id');

    PostMyFavouritesResult postMyFavouritesResult = PostMyFavouritesResult();
    try {
      final response = await http.post(
        _url,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );
      print('Post response status code : ${response.statusCode}');
      if (response.statusCode == 200) {
        postMyFavouritesResult.hasData = true;
        postMyFavouritesResult.massage = 'post done';
        postMyFavouritesResult.postMyFavouritesModel =
            PostMyFavouritesModel.fromJson(jsonDecode(response.body));
        return postMyFavouritesResult;
      } else {
        postMyFavouritesResult.hasData = false;
        postMyFavouritesResult.massage = 'post failed';
        return postMyFavouritesResult;
      }
    } catch (e) {
      postMyFavouritesResult.hasData = false;
      postMyFavouritesResult.massage = 'post done catch error :$e';
      throw Exception('catch post error : $e');
    }
  }
}
