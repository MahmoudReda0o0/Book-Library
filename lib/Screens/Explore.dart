import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:readify/Api%20Http/single%20record/get%20Category/categoryProvider.dart';
import 'package:readify/Screens/Home.dart';
import 'package:readify/Widgets/search_custom.dart';
import 'package:readify/api/search/books.dart';

import '../Widgets/MainBookList.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  int currentindex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/tomo.png'),
              backgroundColor: Colors.white,
              radius: 25,
            ),
          ),
        ),
        backgroundColor: Colors.grey[100],
      ),
      body: CustomScrollView(slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'إكتشف',
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 35,
                    fontFamily: 'Bein',
                    color: Color(0xff2E4374),
                  ),
                ),
                Text(
                  'مكتبة موقعنا',
                  style: TextStyle(
                    height: 1,
                    fontSize: 25,
                    fontFamily: 'Bein',
                    color: Color(0xff2E4374),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SearchCustom(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // TextButton(
                    //     onPressed: (){
                    //       print('object');
                    //     },
                    //     child: Text('<المزيد',
                    //     style: TextStyle(
                    //       fontSize: 25,
                    //       fontFamily: 'Bein',
                    //       color: Colors.blue[900],
                    //       decoration: TextDecoration.underline,
                    //       fontWeight: FontWeight.w100,
                    //     ),
                    //     ),
                    // ),
                    Text(
                      'التصنيفات',
                      style: TextStyle(
                        fontFamily: 'Bein',
                        fontSize: 35,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff2E4374),
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _textButton(
                            'sint-aut-tempore-dolor-blanditiis', 'مغامرات'),
                        _textButton(
                            'assumenda-voluptas-ipsum-vitae-consequuntur-nemo-asperiores-enim-et',
                            'رعب'),
                        _textButton('quam-sed-quo-eos', 'رومانسي'),
                        _textButton(
                            'aut-sunt-in-quo-ipsum-explicabo-eius', 'غموض'),
                        _textButton(
                            'nesciunt-laudantium-minus-corporis-quibusdam',
                            'فانتازيا'),
                        _textButton(
                            'sint-aut-tempore-dolor-blanditiis', 'ديني'),
                        _textButton('provident-consequatur-officiis-vero-est',
                            'كوميدي'),
                        _textButton(
                            'nesciunt-laudantium-minus-corporis-quibusdam',
                            'تاريخ'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<CategoryProvider>(
                  builder: (context, categoryProvider, child) {
                    if (categoryProvider.dataLoaded == true) {
                      var category = categoryProvider
                          .categoryApiResult.categoryModel!.data!.category!;
                      // return Center(
                      //   child: Icon(Icons.done),
                      // );
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.blue,
                        child: ListView.builder(
                          itemCount: category.books!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return MainBooksList(
                              author: category.books![index].author!.nameEn!,
                              title: category.books![index].titleEn!,
                              category: category.nameEn!,
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )
      ]),
      // bottomNavigationBar: BottomNavigationBar(
      //     selectedFontSize: 17,
      //     iconSize: 40,
      //     type : BottomNavigationBarType.fixed,
      //     // backgroundColor: Colors.purple,
      //     currentIndex: 1,
      //     onTap:(int newindex){
      //       setState(() {
      //         currentindex = newindex;
      //         if(currentindex == 0) Navigator.pushNamed(context, 'home');
      //       }
      //       );
      //     } ,
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'الرئيسية',
      //       ),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.explore),
      //           label: 'استكشف'
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.notifications),
      //         label: 'الإشعارات',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.verified_user),
      //         label: 'المستخدم',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.more),
      //         label: 'المزيد',
      //       ),
      //     ]),
    );
  }

  Widget _textButton(String slug, String text) {
    return TextButton(
      onPressed: () =>
          Provider.of<CategoryProvider>(context, listen: false).getData(slug),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Bein',
          color: Color(0xff5EC9EF),
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
