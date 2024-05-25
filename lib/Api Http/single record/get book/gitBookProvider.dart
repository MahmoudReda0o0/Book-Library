import 'package:flutter/material.dart';
import 'package:readify/Api%20Http/single%20record/get%20book/gitBookFetchApi.dart';
import 'package:readify/Constants.dart';

class GetBookProvider extends ChangeNotifier {
  bool dataLoaded = false;
  String bookSlug = Constants.bookSlug;
  BookApiResult bookApiResult = BookApiResult();

  updataBookSlug(String slug) {
    bookSlug = slug;
    notifyListeners();
  }

  getData(String bookSlug) async {
    bookApiResult = await GitBookFetchApi.fetchApi(bookSlug);
    if (bookApiResult.hasData == true) {
      dataLoaded = true;
      print('Provider Get Data done 👍 ');
      notifyListeners();
    } else {
      dataLoaded = false;
      notifyListeners();
    }
  }
}
