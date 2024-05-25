import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readify/Api%20Http/recommend/provider.dart';
import 'package:readify/Api%20Http/zzzTest/widget/text_custom.dart';

class Recommend extends StatelessWidget {
  const Recommend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RecommendProvider>(
        builder: (context, recommendProvider, child) {
          var recommend = recommendProvider.recommendResultApi.recommendModel;
          if (recommendProvider.dataLoaded == true) {
            recommendProvider.updateBookSlug(recommend!.books![0].slug!);
            recommendProvider
                .updateCategorySlug(recommend!.books![0].category!.slug!);
            return Column(
              children: [
                TextCustom.text('count of Books :${recommend!.count}'),
                TextCustom.text(
                    'Frist auther name EN :${recommend.books![1].author!.nameEn}'),
                TextCustom.text('auther slag : ${recommend.books![1].slug}'),
                TextCustom.text('book Tile : ${recommend.books![1].slug}'),
                TextCustom.text(
                    'book provider Slug :${recommendProvider.bookSlug}'),
                TextCustom.text(
                    'Category Provider Slug : ${recommendProvider.categorySlug}'),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
