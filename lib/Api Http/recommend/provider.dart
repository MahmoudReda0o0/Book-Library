import 'package:flutter/material.dart';
import 'package:readify/Api%20Http/recommend/fetch_api.dart';

//enum prfileStates{initial , loading , success , fail }

class RecommendProvider extends ChangeNotifier {
  bool dataLoaded = false;
  String bookSlug = 'earum-possimus-eligendi-deleniti-omnis-harum-ea-quia';
  String categorySlug =
      'assumenda-voluptas-ipsum-vitae-consequuntur-nemo-asperiores-enim-et';

  RecommendResultApi recommendResultApi = RecommendResultApi();

  updateBookSlug(String bookSlug) {
    this.bookSlug = bookSlug;
    notifyListeners();
    print('bookSlug: ${this.bookSlug} 📃');
  }

  updateCategorySlug(String categorySlug) {
    this.categorySlug = categorySlug;
    notifyListeners();
    print('bookSlug: ${this.categorySlug} 📚');
  }

  getData() async {
    recommendResultApi = await RecommendFetchApi.FetchApi();
    if (recommendResultApi.hasData == true) {
      print('Provider Data Loaded');
      dataLoaded = true;
      notifyListeners();
    } else {
      print('Provder Data Failed');
      dataLoaded = false;
      notifyListeners();
    }
  }
}
