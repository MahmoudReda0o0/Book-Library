import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:readify/Widgets/ContinueBookList.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ContinueBookList extends StatefulWidget {
  final String title;
  final String author;
  final String category;
  //final String image;
  const ContinueBookList({
    super.key, required this.title , required this.author, required this.category //, required this.image
});

  @override
  State<ContinueBookList> createState() => _ContinueBookListState();
}

class _ContinueBookListState extends State<ContinueBookList> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 0, 6, 6),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, 'bookDetails');
        },
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffE7F7FD),
              // color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1.0,
                  offset: Offset(0, 5),
                  spreadRadius: 1,
                  color: Colors.black26,
                )
              ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text('${widget.title}',
                        style: TextStyle(
                          fontFamily: 'Bein',
                          color: Color(0xff5EC9EF),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),

                    Text('${widget.author}',
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
                          fontWeight: FontWeight.w100,)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('% مكتمل 34',
                            style: TextStyle(
                              fontFamily: 'Bein',
                              color: Color(0xff5EC9EF),
                              fontSize: 11,
                              fontWeight: FontWeight.w100,)
                        ),
                        SizedBox(
                          width: 170,
                          child: LinearProgressIndicator(
                            value: 0.34,
                            //backgroundColor: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('assets/book1.jpg',
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
