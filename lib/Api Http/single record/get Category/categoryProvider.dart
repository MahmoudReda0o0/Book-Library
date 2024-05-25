import 'package:flutter/material.dart';
import 'package:readify/Api%20Http/single%20record/get%20Category/categoryFetchApi.dart';
import 'package:readify/Api%20Http/single%20record/get%20book/gitBookFetchApi.dart';

class CategoryProvider extends ChangeNotifier {
  bool dataLoaded = false;

  CategoryApiResult categoryApiResult = CategoryApiResult();

  getData(String categorySlug) async {
    dataLoaded = false;
    notifyListeners();
    print('Category dataLoaded :$dataLoaded');
    categoryApiResult = await CategoryFetchApi.fetchApi(categorySlug);
    if (categoryApiResult.hasData == true) {
      dataLoaded = true;
      notifyListeners();
      print('Category dataLoaded :$dataLoaded');
    } else {
      dataLoaded = false;
      notifyListeners();
      print('Category dataLoaded :$dataLoaded');
    }
  }
}
