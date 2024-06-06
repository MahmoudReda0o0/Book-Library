import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readify/Api%20Http/search/provider.dart';
import 'package:readify/Api%20Http/single%20record/get%20Category/categoryProvider.dart';
import 'package:readify/Api%20Http/single%20record/get%20book/gitBookProvider.dart';
import 'package:readify/Api%20Http/zzzTest/widget/text_custom.dart';
import 'package:readify/Widgets/MainBookList.dart';

class SearchCustom extends StatelessWidget {
  const SearchCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          //
          onSubmitted: (searchQuery) {
            Provider.of<Searchprovider>(context, listen: false)
                .getData(searchQuery);
            print(searchQuery);
          },
          style: TextStyle(fontSize: 20, height: 1),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: const Color.fromARGB(137, 61, 61, 61)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.5, color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Consumer<Searchprovider>(builder: (context, searchProvider, child) {
          if (searchProvider.startSearch == true) {
            if (searchProvider.dataLoaded == true) {
              if (searchProvider
                      .searchReasultApi.searchModel.data!.books!.length ==
                  0) {
                return Center(
                  child: Text('Nothing Found'),
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.sizeOf(context).width,
                  child: ListView.builder(
                    itemCount: searchProvider
                        .searchReasultApi.searchModel.data!.books!.length,
                    itemBuilder: (BuildContext context, index) {
                      var s = searchProvider
                          .searchReasultApi.searchModel.data!.books![index];
                      return MainBooksList(
                          title: s.titleEn!,
                          author: s.author!.nameEn!,
                          category: s.category!.nameEn!);
                    },
                  ),
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          } else {
            return Center(
              child: Text('Start Search'),
            );
          }
        }),
        Center(
          child: IconButton(
            icon: Icon(
              Icons.delete,
            ),
            onPressed: () {
              Provider.of<Searchprovider>(context, listen: false)
                  .update_noSearch(false);
            },
          ),
        ),
      ],
    );
  }
}
