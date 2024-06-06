import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:readify/Api%20Http/my_book/my_books_provider.dart';
import 'package:readify/Api%20Http/recommend/provider.dart';
import 'package:readify/Api%20Http/single%20record/get%20Category/categoryProvider.dart';
import 'package:readify/Api%20Http/single%20record/get%20profile/profileProvider.dart';
import 'package:readify/Constants.dart';
import 'package:readify/Widgets/ContinueBookList.dart';
import 'package:readify/api/BookDetailsApi.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Widgets/MainBookList.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

String title = '';
String author = '';
String category = '';
String imgUrl = '';

class _HomeState extends State<Home> {
  late Map<String, dynamic> bookDetails;
  void initState() {
    super.initState();
    // TODO: pass acutal slug for clicked book
    fetchBookDetails(Constants.rand_book_slug).then((details) {
      if (details != null) {
        print('Book title (Arabic): ${details.titleAr}');
        title = details.titleAr;
        author = details.author.nameAr;
        category = details.category.nameAr;
        // des = details.descrAr.toString();
        imgUrl = details.img;
        // print(details.category);
        //print(details.reviews.rate);
        // print('Book title (English): ${details.reviews}');
        print('Book price: ${details.price}');
      } else {
        print('Failed to fetch book details');
      }
    });
  }

  @override
  int activeindex = 0;
  int currentindex = 0;
  Widget build(BuildContext context) {
    final ppLink = "i.imgur.com/M3Wa1Rm.jpeg";
    final trendzing = [
      MainBooksList(
        title: title,
        author: author,
        category: category,
      ),
    ];

    return Consumer4<ProfileProvider, RecommendProvider, MyBookProvider,
        CategoryProvider>(
      builder: (context, profile, recommend, myBooks, category, child) {
        if (profile.dataLoaded == true &&
            myBooks.dataGet == true &&
            recommend.dataLoaded == true &&
            category.dataLoaded == true) {
          return Scaffold(
            appBar: AppBar(
              //
              flexibleSpace: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: // EdgeInsets.fromLTRB(40,4,4,4),
                      EdgeInsets.all(4),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/tomo.png'),
                    radius: 25,
                  ),
                ),
              ),
              title: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Yusef Hassan',
                  style: TextStyle(
                      color: Colors.blue, fontFamily: 'Bein', letterSpacing: 1),
                  textAlign: TextAlign.right,
                ),
              ),
              backgroundColor: Colors.grey[100],
            ),
            body: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Column(
                      children: [
                        CarouselSlider(
                            items: [
                              MainBooksList(
                                title: recommend.recommendResultApi
                                    .recommendModel!.books![0].titleEn!,
                                author: recommend.recommendResultApi
                                    .recommendModel!.books![0].author!.nameEn!,
                                category: recommend
                                    .recommendResultApi
                                    .recommendModel!
                                    .books![0]
                                    .category!
                                    .nameEn!,
                              ),
                            ],
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeindex = index;
                                });
                              },
                              autoPlay: true,
                              //   padEnds: false,
                              viewportFraction: 1,
                            )),
                        AnimatedSmoothIndicator(
                            activeIndex: activeindex, count: 1),
                      ],
                    ),
                  ), // slider
                  SizedBox(
                    height: 25,
                  ),

                  TitleWithIcon(
                    title: 'أكمل القراءة',
                    icon: Icons.chrome_reader_mode_rounded,
                    route: 'cntReading',
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myBooks.getMyBookResult.myBookModel!.data!
                          .myBooks!.readingBooks!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var _myBook = myBooks.getMyBookResult.myBookModel!.data!
                            .myBooks!.readingBooks![index].book;
                        return MainBooksList(
                          title: _myBook!.titleEn!,
                          author: _myBook!.author!.nameEn!,
                          category: _myBook!.category!.nameEn!,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TitleWithIcon(
                    title: 'الموصي به لك',
                    icon: Icons.recommend_rounded,
                    route: 'Recommended',
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recommend
                          .recommendResultApi.recommendModel!.books!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MainBooksList(
                          title: recommend.recommendResultApi.recommendModel!
                              .books![index].titleEn!,
                          author: recommend.recommendResultApi.recommendModel!
                              .books![index].author!.nameEn!,
                          category: recommend.recommendResultApi.recommendModel!
                              .books![index]!.category!.nameEn!,
                        );
                      },
                    ),
                  )
                ],
              ),
            )),
            // bottomNavigationBar: BottomNavigationBar(
            //   selectedFontSize: 17,
            //     iconSize: 40,
            //     type : BottomNavigationBarType.fixed,
            //  // backgroundColor: Colors.purple,
            //   currentIndex: 0,
            //     onTap:(int newindex){
            //       setState(() {
            //         currentindex = newindex;
            //         if(currentindex == 1) Navigator.pushNamed(context, 'explore');
            //       }
            //       );
            //     } ,
            //     items: const [
            //       BottomNavigationBarItem(
            //        icon: Icon(Icons.home),
            //        label: 'الرئيسية',
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
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class TitleWithIcon extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;
  const TitleWithIcon(
      {Key? key, required this.title, required this.icon, required this.route
      //super.key,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(13, 13, 13, 4),
                  child: Text(
                    title,
                    style: TextStyle(
                      height: 1,
                      color: Color(0xff5ec9ef),
                      fontSize: 30,
                      fontFamily: 'Bein',
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Icon(
                  icon,
                  color: Color(0xff5ec9ef),
                ),
              ],
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'أظهر المزيد',
                style: TextStyle(
                    color: Color(0xff5EC9EF),
                    fontSize: 20,
                    fontFamily: 'Bein',
                    letterSpacing: 1,
                    decoration: TextDecoration.underline),
              ),
              WidgetSpan(
                  child: Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: Color(0xff5EC9EF),
              ))
            ]))
          ],
        ),
      ),
    );
  }
}

class sliderWidget extends StatelessWidget {
  const sliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'bookDetails');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(35),
            // boxShadow: [
            //   BoxShadow(
            //     blurRadius: 1.0,
            //     offset: Offset(0, 30),
            //     spreadRadius: 10,
            //     //color: Colors.blue,
            //   )
            // ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'موعود بملك العلا',
                    style: TextStyle(
                      fontFamily: 'Bein',
                      color: Colors.blue[600],
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    'للكاتبة كاريدينيا',
                    style: TextStyle(
                      fontFamily: 'Bein',
                      color: Colors.blue[500],
                      fontSize: 19,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Text('التصنيف: رعب',
                      style: TextStyle(
                        fontFamily: 'Bein',
                        color: Colors.blue[500],
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 8, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/book1.jpg',
                    scale: 1.75,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
