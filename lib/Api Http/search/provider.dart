import 'package:flutter/material.dart';
import 'package:readify/Api%20Http/search/fetch_api.dart';

class Searchprovider extends ChangeNotifier {
  bool dataLoaded = false;
  bool startSearch = false;
  SearchReasultApi searchReasultApi = SearchReasultApi();

  update_noSearch(bool startSearch) {
    this.startSearch = startSearch;
    notifyListeners();
    print(startSearch);
  }

  getData(String searchWord) async {
    update_noSearch(true);
    dataLoaded = false;
    notifyListeners();
    searchReasultApi = await SearchFetchApi.getdata(searchWord);
    if (searchReasultApi.hasData == true) {
      dataLoaded = true;
      notifyListeners();
    } else {
      dataLoaded = false;
      notifyListeners();
    }
  }
}
