// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readify/Screens/Explore.dart';
import 'package:http/http.dart' as http;
import 'package:readify/api/BookDetailsApi.dart';
import 'package:readify/Constants.dart';
import 'MyTabBar.dart';
import 'dart:convert';

String title = '';
String author = '';
String imgUrl = '';

int currentIndex = 0;
int likes = 10;
int dislikes = 10;
bool _aboutBook = true;
bool _reviews = false;
bool _details = false;
bool _checked = false;
bool _liked = false;
bool _disliked = false;
bool _favorite = false;
String firstChapter = 'ماذا يجب على ان افعل حيال مستقبلى ؟ نعل ؟” فأصبحت  امرى';
String des = '';

class BookDetails extends StatefulWidget {
  const BookDetails({Key? key}) : super(key: key);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late Map<String, dynamic> bookDetails;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // TODO: pass acutal slug for clicked book
    fetchBookDetails(Constants.rand_book_slug).then((details) {
      if (details != null) {
        print('Book title (Arabic): ${details.titleAr}');
        title = details.titleAr.toString();
        author = details.author.nameAr.toString();
        des = details.descrAr.toString();
        // imgUrl = details.img;
        print(details.category.nameAr);
        // print(details.img);
        //print(details.reviews.rate);
        // print('Book title (English): ${details.reviews}');
        print('Book price: ${details.price}');
      } else {
        print('Failed to fetch book details');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController tabctrl = TabController(length: 2, vsync: this);
    final details = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الوصف:',
            style: TextStyle(
                color: Color(0xff5EC9EF), fontFamily: 'Bein', fontSize: 22),
          ),
          Text(
            des,
            style: TextStyle(
                color: Color(0xff5EC9EF),
                fontSize: 18,
                fontFamily: 'Bein',
                fontWeight: FontWeight.w100),
          ),
          Text(
            'التصنيف:',
            style: TextStyle(
                color: Color(0xff5EC9EF), fontFamily: 'Bein', fontSize: 22),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffF7FCFE),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xffAFB9CC), width: 1.5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Text(
                    'رومانسي',
                    style: TextStyle(
                        color: Color(0xff2E4374),
                        fontFamily: 'Bein',
                        fontSize: 15),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffAFB9CC), width: 1.5),
                    color: Color(0xffF7FCFE),
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Text(
                    'دراما',
                    style: TextStyle(
                        color: Color(0xff2E4374),
                        fontFamily: 'Bein',
                        fontSize: 15),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffF7FCFE),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xffAFB9CC), width: 1.5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Text(
                    'زواج إجباري',
                    style: TextStyle(
                        color: Color(0xff2E4374),
                        fontFamily: 'Bein',
                        fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 7),
            child: Divider(
              thickness: 2,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'pdf');
            },
            child: Center(
              child: ElevatedButton(
                  onPressed: null,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                              child: Icon(
                                Icons.headphones,
                                color: Colors.white,
                              ),
                            ),
                            alignment: PlaceholderAlignment.middle),
                        TextSpan(text: 'الإستماع للكتاب'),
                      ],
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Bein',
                          color: Colors.white),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[400]),
                      elevation: MaterialStateProperty.all(3))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'pdf');
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                              child: Icon(
                                Icons.book_outlined,
                                color: Colors.white,
                              ),
                            ),
                            alignment: PlaceholderAlignment.middle),
                        TextSpan(text: 'قراءة الكتاب'),
                      ],
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Bein',
                          color: Colors.white),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[400]),
                      elevation: MaterialStateProperty.all(3))),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'pdf');
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                              child: Icon(
                                Icons.movie,
                                color: Colors.white,
                              ),
                            ),
                            alignment: PlaceholderAlignment.middle),
                        TextSpan(text: 'مشاهدة الفيلم'),
                      ],
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Bein',
                          color: Colors.white),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[400]),
                      elevation: MaterialStateProperty.all(3))),
            ],
          )
        ],
      ),
      Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xffEFF6F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/gundou.jpg'),
                            backgroundColor: Colors.white,
                          ),
                          Text(
                            '  جوندو تشان',
                            style: TextStyle(
                              color: Color(0xff4DC4EF),
                            ),
                          ),
                        ],
                      ),
                      RatingBar.builder(
                        // ignoreGestures: true,
                        initialRating: 3,
                        minRating: 3,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        color: Colors.blueGrey,
                        width: 3,
                        height: 30,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'أخبر الجميع عن رأيك',
                            hintStyle: TextStyle(
                              color: Color(0xff4DC4EF),
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.values[3],
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Checkbox(
                              value: _checked,
                              onChanged: (value) {
                                setState(() {
                                  _checked = !_checked;
                                });
                              },
                              fillColor: MaterialStateProperty.all(
                                  _checked ? Colors.blueAccent : Colors.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => BorderSide(
                                    width: 2.5, color: Colors.blueAccent),
                              ),
                            ),
                          ),
                          Text(
                            ' إخفاء للاحتواء علي حرق للاحداث',
                            style: TextStyle(
                              color: Color(0xff4DC4EF),
                            ),
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Text(
                              '  أرسل الرد',
                              style: TextStyle(
                                height: 1.5,
                                color: Color(0xff4DC4EF),
                              ),
                            ),
                            Icon(
                              Icons.send,
                              color: Color(0xff4DC4EF),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/carol.jpg'),
                          backgroundColor: Colors.white,
                        ),
                        Text(
                          '  كارول تشان',
                          style: TextStyle(
                            color: Color(0xff4DC4EF),
                          ),
                        ),
                      ],
                    ),
                    RatingBar.builder(
                      ignoreGestures: true,
                      initialRating: 3,
                      minRating: 3,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
              Text(
                'تقييم.............',
                style: TextStyle(color: Color(0xff4DC4EF), fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Text(
                              'أرسل الرد  ',
                              style: TextStyle(
                                height: 1.5,
                                color: Color(0xff4DC4EF),
                              ),
                            ),
                            Icon(
                              Icons.send,
                              color: Color(0xff4DC4EF),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '$likes' + '',
                        style:
                            TextStyle(color: Color(0xff4DC4EF), fontSize: 20),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (!_liked) {
                                if (_disliked) dislikes--;
                                _liked = true;
                                _disliked = false;
                                likes++;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.one_k,
                            color: _liked ? Colors.blueAccent : Colors.grey,
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3),
                        child: Container(
                          color: Colors.blueGrey,
                          height: 20,
                          width: 5,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (!_disliked) {
                                if (_liked) likes--;
                                _liked = false;
                                _disliked = true;
                                dislikes++;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.two_k,
                            color: _disliked ? Colors.blueAccent : Colors.grey,
                          )),
                      Text(
                        '' + '$dislikes',
                        style:
                            TextStyle(color: Color(0xff4DC4EF), fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
              Divider(
                color: Colors.black,
              )
            ],
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الفصول: 5 فصول',
            style: TextStyle(
              fontFamily: 'Bein',
              fontSize: 15,
              color: Color(0xff5EC9EF),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              textColor: Colors.blue[500],
              title: Text(
                'الفصل الأول',
                style: TextStyle(
                  fontFamily: 'Bein',
                  fontSize: 20,
                  color: Color(0xff5EC9EF),
                ),
              ),
              children: [
                Text(
                  firstChapter,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff4CC5EE),
                      fontFamily: 'Bein'),
                ),
                Divider(
                  color: Color(0xff5EC9EF),
                )
              ],
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              textColor: Colors.blue[500],
              title: Text(
                'الفصل الثاني',
                style: TextStyle(
                  fontFamily: 'Bein',
                  fontSize: 20,
                  color: Color(0xff5EC9EF),
                ),
              ),
              children: [
                Text(
                  firstChapter,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff5EC9EF),
                      fontFamily: 'Bein'),
                ),
                Divider(color: Colors.black)
              ],
            ),
          ),
        ],
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.grey[100],
          flexibleSpace: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 4, 4, 4),
              //EdgeInsets.all(4),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/tomo.png'),
                radius: 25,
              ),
            ),
          ),
        ),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  //main column
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /*ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              imgUrl,
                              scale: 5,
                            )),*/
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 12, 12, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '68 تقييم',
                                style: TextStyle(
                                    color: Color(0xff5EC9EF),
                                    fontFamily: 'Bein',
                                    fontSize: 14,
                                    height: 1,
                                    fontWeight: FontWeight.w100),
                              ),
                              RatingBar.builder(
                                ignoreGestures: true,
                                initialRating: 3,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 15,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 1),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                title,
                                style: TextStyle(
                                    height: 1.5,
                                    color: Color(0xff5EC9EF),
                                    fontFamily: 'Bein',
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                author,
                                style: TextStyle(
                                    color: Color(0xff5EC9EF),
                                    fontFamily: 'Bein',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w100),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xff5EC9EF),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '4س 12د 15ث',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Bein',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xff5EC9EF),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '5 فصل',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Bein',
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _favorite = !_favorite;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: _favorite
                                        ? Color(0xff5EC9EF)
                                        : Colors.grey,
                                  )),
                              IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.upload,
                                    color: Color(0xff5EC9EF),
                                  )),
                              IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.download,
                                    color: Color(0xff5EC9EF),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  currentIndex = 0;
                                  _aboutBook = true;
                                  _details = false;
                                  _reviews = false;
                                });
                              },
                              child: Text(
                                'عن الكتاب',
                                style: TextStyle(
                                    height: 1,
                                    color: Color(0xff5EC9EF),
                                    fontFamily: 'Bein',
                                    fontSize: 21,
                                    decoration: _aboutBook
                                        ? TextDecoration.underline
                                        : null),
                              )),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  currentIndex = 1;
                                  _aboutBook = false;
                                  _reviews = true;
                                  _details = false;
                                });
                              },
                              child: Text(
                                'المراجعات',
                                style: TextStyle(
                                    height: 1,
                                    color: Color(0xff5EC9EF),
                                    fontFamily: 'Bein',
                                    fontSize: 21,
                                    decoration: _reviews
                                        ? TextDecoration.underline
                                        : null),
                              )),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  currentIndex = 2;
                                  _aboutBook = false;
                                  _reviews = false;
                                  _details = true;
                                });
                              },
                              child: Text(
                                'التفاصيل',
                                style: TextStyle(
                                    height: 1,
                                    color: Color(0xff5EC9EF),
                                    fontFamily: 'Bein',
                                    fontSize: 21,
                                    decoration: _details
                                        ? TextDecoration.underline
                                        : null),
                              )),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 2,
                      color: Colors.grey[400],
                    ),
                    details[currentIndex]
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
