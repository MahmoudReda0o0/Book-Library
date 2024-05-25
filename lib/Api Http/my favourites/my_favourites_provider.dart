import 'package:flutter/material.dart';
import 'package:readify/Api%20Http/my%20favourites/post/fetch_api.dart';
import 'package:readify/Api%20Http/my%20favourites/get/fetch_api.dart';

class MyFavouritesProvider extends ChangeNotifier {
  bool dataPost = false;
  bool dataGet = false;
  PostMyFavouritesResult postMyFavouritesResult = PostMyFavouritesResult();
  GetFavouritesResult getFavouritesResult = GetFavouritesResult();

  getData() async {
    getFavouritesResult = await FavouritesFetchApi.fetchApi();
    if (getFavouritesResult.hasData == true) {
      dataGet = true;
      notifyListeners();
    } else {
      dataGet = false;
      notifyListeners();
    }
  }

  postData({required int id}) async {
    postMyFavouritesResult = await PostMyFavouritesFetchApi.fetchData(id: id);
    if (postMyFavouritesResult.hasData == true) {
      dataPost = true;
      notifyListeners();
    } else {
      dataPost = false;
      notifyListeners();
    }
  }
}
