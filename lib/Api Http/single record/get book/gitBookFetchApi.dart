import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:readify/Api%20Http/Single%20Record/get%20book/gitBookModel.dart';
import 'package:readify/Constants.dart';

class BookApiResult {
  bool? hasData;
  bool? catchError;
  String? message;
  BookModel? bookModel;
}

class GitBookFetchApi {
  static Future<BookApiResult> fetchApi(String bookSlug) async {
    final _url = Uri.parse('http://127.0.0.1:8000/api/book/$bookSlug');
    BookApiResult bookApiResult = BookApiResult();
    try {
      print('Get Book Url:${_url}');
      final response = await http.get(
        _url,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );
      print('Get Book Response Status Code :${response.statusCode} 🤓');
      if (response.statusCode == 200) {
        bookApiResult.hasData = true;
        bookApiResult.message = 'Book Data is recived';
        bookApiResult.bookModel = BookModel.fromJson(jsonDecode(response.body));
        //print(bookApiResult.bookModel!.data!.book!.author!.nameEn);
        return bookApiResult;
      } else {
        print('else error StatusCode : ${response.statusCode}');
        bookApiResult.hasData = false;
        bookApiResult.message = 'Book Data is Failed';
        return bookApiResult;
      }
    } catch (e) {
      bookApiResult.catchError = true;
      bookApiResult.message = 'Catch Error $e';
      return throw Exception('Git Book Catch Error : $e');
    }
  }
}
