import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readify/Api%20Http/my%20favourites/my_favourites_provider.dart';
import 'package:readify/Api%20Http/single%20record/get%20Category/categoryProvider.dart';
import 'package:readify/Screens/Home.dart';
import 'package:readify/Widgets/MainBookList.dart';

class Mybbb extends StatefulWidget {
  const Mybbb({super.key});

  @override
  State<Mybbb> createState() => _MybbbState();
}

class _MybbbState extends State<Mybbb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CategoryProvider>(
        builder: ((context, c, child) {
          return Column(
            children: [
              ListView.builder(
                itemCount: c.categoryApiResult.categoryModel!.data!.category!
                    .books!.length,
                itemBuilder: (context, index) {
                  MainBooksList(
                      title: c.categoryApiResult.categoryModel!.data!.category!
                          .books![index].author!.nameEn!,
                      author: 'author',
                      category: 'category');
                },
              ),
              Center(
                child: Text(
                    '${c.categoryApiResult.categoryModel!.data!.category!.books![0].author!.nameEn!}'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
//  Container(
//                             //color: Colors.red,
//                             height: MediaQuery.of(context).size.height * 0.65,
//                             width: MediaQuery.of(context).size.width,
//                             child: ListView.builder(
//                                 itemCount: profile!.favourites!.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   if (profile.favourites!.length == null) {
//                                     return Center();
//                                   } else {
//                                     return MainBooksList(
//                                       author: profile.favourites![index].book!
//                                           .author!.nameEn!,
//                                       category: profile.favourites![index].book!
//                                           .category!.nameEn!,
//                                       title: profile
//                                           .favourites![index].book!.titleEn!,
//                                     );
//                                   }
//                                 }),
//                           )

class MyFavourites extends StatelessWidget {
  var conFavouritesId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CategoryProvider>(
        builder: ((context, c, child) {
          return Column(
            children: [
              ListView.builder(
                itemCount: c.categoryApiResult.categoryModel!.data!.category!
                    .books!.length,
                itemBuilder: (context, index) {
                  MainBooksList(
                      title: c.categoryApiResult.categoryModel!.data!.category!
                          .books![index].author!.nameEn!,
                      author: 'author',
                      category: 'category');
                },
              ),
              Center(
                child: Text(
                    '${c.categoryApiResult.categoryModel!.data!.category!.books![0].author!.nameEn!}'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
