import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readify/Api%20Http/my%20favourites/my_favourites_provider.dart';
import 'package:readify/Api%20Http/my_book/my_books_provider.dart';
import 'package:readify/Api%20Http/recommend/provider.dart';
import 'package:readify/Api%20Http/single%20record/get%20Category/categoryProvider.dart';
import 'package:readify/Api%20Http/single%20record/get%20book/gitBookProvider.dart';
import 'package:readify/Api%20Http/single%20record/get%20profile/profileProvider.dart';
import 'package:readify/Api%20Http/zzzTest/test1.dart';
import 'package:readify/Screens/SignIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GetBookProvider>(
            create: (context) => GetBookProvider()),
        ChangeNotifierProvider<ProfileProvider>(
            create: (context) => ProfileProvider()),
        ChangeNotifierProvider<MyFavouritesProvider>(
            create: (context) => MyFavouritesProvider()),
        ChangeNotifierProvider<RecommendProvider>(
            create: (context) => RecommendProvider()),
        ChangeNotifierProvider<MyBookProvider>(
            create: (context) => MyBookProvider()),
        ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
      ],
      child: MaterialApp(
        //navigatorKey: navigationKey,
        debugShowCheckedModeBanner: false,
        //title: 'Anees ',
        //theme: ThemeData(fontFamily: ('Alexandria')),
        home: SignIn(),
      ),
    );
  }
}
