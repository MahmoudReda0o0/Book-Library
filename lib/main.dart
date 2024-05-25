import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:readify/Api%20Http/search/provider.dart';
import 'package:readify/Screens/BookDetails.dart';
import 'package:readify/Screens/Explore.dart';
import 'package:readify/Screens/ForgetPassword.dart';
import 'package:readify/Screens/More.dart';
import 'package:readify/Screens/MyTabBar.dart';
import 'package:readify/Screens/PDF.dart';
import 'package:readify/Screens/Recommended.dart';
import 'package:readify/Screens/ResetPassword.dart';
import 'package:readify/Screens/Screen.dart';
import 'package:readify/Screens/SignIn.dart';
import 'package:readify/Screens/SignUp.dart';
import 'package:readify/Screens/Trending.dart';
import 'package:readify/Screens/ContinueReading.dart';
import 'package:readify/Screens/User.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'Screens/Home.dart';
import 'Screens/VerifyEmail.dart';
import 'package:provider/provider.dart';
import 'package:readify/Api%20Http/my%20favourites/my_favourites_provider.dart';
import 'package:readify/Api%20Http/my_book/my_books_provider.dart';
import 'package:readify/Api%20Http/recommend/provider.dart';
import 'package:readify/Api%20Http/single%20record/get%20Category/categoryProvider.dart';
import 'package:readify/Api%20Http/single%20record/get%20book/gitBookProvider.dart';
import 'package:readify/Api%20Http/single%20record/get%20profile/profileProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  int activeindex = 0;
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
        ChangeNotifierProvider<Searchprovider>(
            create: (context) => Searchprovider()),
      ],
      child: MaterialApp(
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: [
        //   Locale('ar','AE'), // English
        // ],
        debugShowCheckedModeBanner: false,
        initialRoute: 'signIn',
        routes: {
          // 'home' : (context) => Home(),
          // 'explore' :(context) => Explore(),
          'screen': (context) => Screen(),
          'verify': (context) => VerifyEmail(),
          'forget': (context) => ForgetPassword(),
          'reset': (context) => ResetPass(),
          'pdf': (context) => PDF(),
          'bookDetails': (context) => BookDetails(),
          'cntReading': (context) => ContinueReading(),
          'Recommended': (context) => Recommended(),
          'trending': (context) => Trending(),
          'signIn': (context) => SignIn(),
          'signUp': (context) => SignUp(),
        },
        theme: ThemeData(
          fontFamily: 'Bein',
        ),
      ),
    );
  }
}
