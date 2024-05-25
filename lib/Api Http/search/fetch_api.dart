import 'dart:convert';

import 'package:readify/Api%20Http/search/model.dart';
import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';

class SearchReasultApi {
  bool hasData = false;
  String massage = '';
  SearchModel searchModel = SearchModel();
}

class SearchFetchApi {
  static Future<SearchReasultApi> getdata(String searchWord) async {
    final _uri = Uri.parse('${Constants.search}$searchWord');
    SearchReasultApi searchReasultApi = SearchReasultApi();
    try {
      final response = await http.get(
        _uri,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );
      print('response Search : ${response.statusCode}');
      if (response.statusCode == 200) {
        searchReasultApi.hasData = true;
        searchReasultApi.searchModel = SearchModel.fromJson(
          jsonDecode(response.body),
        );
      } else {
        searchReasultApi.hasData = false;
      }
      return searchReasultApi;
    } catch (e) {
      print('catch Search Error : $e');
      return searchReasultApi;
    }
  }
}
