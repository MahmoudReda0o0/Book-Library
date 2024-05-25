import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:readify/Api%20Http/recommend/model.dart';
import 'package:readify/Constants.dart';

class RecommendResultApi {
  bool? hasData;
  String? massage;
  RecommendModel? recommendModel;
}

class RecommendFetchApi {
  static Future<RecommendResultApi> FetchApi() async {
    final _url = Uri.parse('${Constants.recommend}');
    RecommendResultApi recommendResultApi = RecommendResultApi();
    try {
      final response = await http.get(
        _url,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );
      print('Recommend Response Status Code : ${response.statusCode}');
      if (response.statusCode == 200) {
        recommendResultApi.hasData = true;
        recommendResultApi.massage = 'Profile Data Done';
        recommendResultApi.recommendModel =
            RecommendModel.fromJson(jsonDecode(response.body));
        //print('${recommendResultApi.recommendModel!.books![2].author!.bioAr}');
        return recommendResultApi;
      } else {
        recommendResultApi.hasData = false;
        recommendResultApi.massage = 'Profile Data Failed';
        return recommendResultApi;
      }
    } catch (e) {
      recommendResultApi.hasData = false;
      recommendResultApi.massage = 'Catch Error $e';
      throw Exception('Catch Error $e');
    }
  }
}
