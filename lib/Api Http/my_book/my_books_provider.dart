import 'package:flutter/material.dart';

import 'package:readify/Api%20Http/my_book/get/fetch_api.dart';
import 'package:readify/Api%20Http/my_book/post/fetch_api.dart';

class MyBookProvider extends ChangeNotifier {
  bool dataPost = false;
  bool dataGet = false;
  PostMyBookResult postMyBookResult = PostMyBookResult();
  GetMyBookResult getMyBookResult = GetMyBookResult();

  getData() async {
    getMyBookResult = await GetMyBookFetchApi.fetchApi();
    if (getMyBookResult.hasData == true) {
      dataGet = true;
      notifyListeners();
    } else {
      dataGet = false;
      notifyListeners();
    }
  }

  postData({required int id}) async {
    postMyBookResult = await PostMyBookFetchApi.fetchData(id: id);
    if (postMyBookResult.hasData == true) {
      dataPost = true;
      notifyListeners();
    } else {
      dataPost = false;
      notifyListeners();
    }
  }
}
