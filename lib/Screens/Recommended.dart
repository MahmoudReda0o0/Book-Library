import 'package:flutter/material.dart';

import '../Widgets/MainBookList.dart';
import 'Home.dart';

class Recommended extends StatefulWidget {
  const Recommended({super.key});

  @override
  State<Recommended> createState() => _Recommended();
}

class _Recommended extends State<Recommended> {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ColorFiltered(
                  child: Image.asset(
                    'assets/liberary.jpg',
                    scale: 1.8,
                  ),
                  colorFilter:
                      ColorFilter.mode(Colors.blueAccent, BlendMode.modulate),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MainBooksList(
                title: title,
                author: author,
                category: category,
              ),
              SizedBox(
                height: 20,
              ),
              MainBooksList(
                title: title,
                author: author,
                category: category,
              ),
              SizedBox(
                height: 20,
              ),
              MainBooksList(
                title: title,
                author: author,
                category: category,
              ),
              SizedBox(
                height: 20,
              ),
              MainBooksList(
                title: title,
                author: author,
                category: category,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
