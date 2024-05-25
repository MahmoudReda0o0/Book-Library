import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readify/Api%20Http/my%20favourites/my_favourites_provider.dart';
import 'package:readify/Api%20Http/recommend/provider.dart';
import 'package:readify/Api%20Http/single%20record/get%20Category/categoryProvider.dart';
import 'package:readify/Api%20Http/single%20record/get%20book/gitBookFetchApi.dart';
import 'package:readify/Api%20Http/single%20record/get%20book/gitBookProvider.dart';
import 'package:readify/Api%20Http/single%20record/get%20profile/profileModel.dart';
import 'package:readify/Api%20Http/single%20record/get%20profile/profileProvider.dart';
import 'package:readify/Api%20Http/zzzTest/book.dart';
import 'package:readify/Api%20Http/zzzTest/my_favourtes.dart';
import 'package:readify/Api%20Http/zzzTest/recommend.dart';
import 'package:readify/Api%20Http/zzzTest/t%20profile.dart';
import 'package:readify/Api%20Http/zzzTest/widget/buttonCustom.dart';

class Test1 extends StatelessWidget {
  const Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Api'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Provider.of<ProfileProvider>(context, listen: false).getData();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TestProfile()));
          },
        ),
      ),
      body: Consumer3<RecommendProvider, GetBookProvider, CategoryProvider>(
          builder: (context, recommend, getBook, category, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Button.buttonCustom(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => BookTest())));
            }, 'Search Test'),
            Button.buttonCustom(() async {
              await category.getData(
                  'assumenda-voluptas-ipsum-vitae-consequuntur-nemo-asperiores-enim-et');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyFavourites(),
                ),
              );
            }, 'Get Category Book'),
            Button.buttonCustom(() {
              // recommend.updateBookSlug(
              //     recommend.recommendResultApi.recommendModel!.books![0].slug!);
              print(recommend.bookSlug);
            }, 'book Slug'),
            Button.buttonCustom(() {
              // recommend.updateCategorySlug(recommend.recommendResultApi
              //     .recommendModel!.books![0].category!.slug!);
              print(recommend.categorySlug);
            }, 'category Slug'),
            Button.buttonCustom(() async {
              await getBook.getData(recommend.bookSlug!);
              await category.getData(recommend.categorySlug);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookTest(),
                ),
              );
            }, 'book Data'),
            Button.buttonCustom(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyFavourites()));
            }, 'My Favourites')
          ],
        );
      }),
    );
  }
}
