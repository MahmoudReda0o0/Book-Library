import 'dart:convert';

import 'package:readify/Api%20Http/my%20favourites/get/model.dart';
import 'package:readify/Constants.dart';
import 'package:http/http.dart' as http;

class GetFavouritesResult {
  bool? hasData;
  String? massage;
  MyFavouritesModel? favouritesModel;
}

class FavouritesFetchApi {
  static Future<GetFavouritesResult> fetchApi() async {
    final _uri = Uri.parse("${Constants.myFavorites}");

    GetFavouritesResult getFavouritesResult = GetFavouritesResult();

    try {
      final response = await http.get(
        _uri,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );
      print('Favourites response Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        getFavouritesResult.favouritesModel =
            MyFavouritesModel.fromJson(jsonDecode(response.body));
        getFavouritesResult.hasData = true;
        getFavouritesResult.massage = 'date done';
        return getFavouritesResult;
      } else {
        getFavouritesResult.hasData = false;
        getFavouritesResult.massage = ' data Failed';
        return getFavouritesResult;
      }
    } catch (e) {
      getFavouritesResult.hasData = false;
      getFavouritesResult.massage = 'catch error : $e';
      throw Exception('Catch Error : $e');
    }
  }
}
