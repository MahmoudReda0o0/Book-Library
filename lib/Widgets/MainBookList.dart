import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:readify/Api%20Http/single%20record/get%20book/gitBookProvider.dart';

class MainBooksList extends StatefulWidget {
  final String title;
  final String author;
  final String category;
  
  //final String image;
  const MainBooksList({
    super.key,
    required this.title,
    required this.author,
    required this.category,
     //, required this.image
  });

  @override
  State<MainBooksList> createState() => _MainBooksListState();
}

class _MainBooksListState extends State<MainBooksList> {
  bool _favorites = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 0, 6, 6),
      child: GestureDetector(
        onTap: () async {
          
          Navigator.pushNamed(context, 'bookDetails');
        },
        child: Container(
          decoration: BoxDecoration(
              // color: Color(0xffE7F7FD),
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1.0,
                  offset: Offset(0, 5),
                  spreadRadius: 1,
                  color: Colors.black26,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "${widget.title}",
                      style: TextStyle(
                        fontFamily: 'Bein',
                        color: Color(0xff5EC9EF),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  Text(
                    '${widget.author}',
                    style: TextStyle(
                      fontFamily: 'Bein',
                      color: Color(0xff5EC9EF),
                      fontSize: 17,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Text('التصنيف:' + '${widget.category}',
                      style: TextStyle(
                        fontFamily: 'Bein',
                        color: Color(0xff5EC9EF),
                        fontSize: 11,
                        fontWeight: FontWeight.w100,
                      )),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: RatingBar.builder(
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
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            decoration: BoxDecoration(
                                color: Color(0xff5EC9EF),
                                borderRadius: BorderRadius.circular(20)),
                            child: RichText(
                                text: TextSpan(children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.menu_book,
                                color: Colors.white,
                                size: 15,
                              )),
                              TextSpan(
                                  text: '    التفاصيل',
                                  style: TextStyle(
                                    fontFamily: 'Bein',
                                    fontSize: 15,
                                  )),
                            ])),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _favorites = !_favorites;
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              color:
                                  _favorites ? Color(0xff5EC9EF) : Colors.grey,
                              size: 30,
                            )),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
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
