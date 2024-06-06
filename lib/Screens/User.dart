// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:readify/Api%20Http/single%20record/get%20profile/profileProvider.dart';
import 'package:readify/Widgets/MainBookList.dart';
import 'dart:convert';

import 'package:readify/Constants.dart';

class User extends StatefulWidget {
  const User({Key? key});

  @override
  State<User> createState() => _UserState();
}

class UserData {
  final String username;
  final String email;
  // final List<String> favourites;
  // final List<String> bookmarks;
  // final List<String> reviews;

  UserData({
    required this.username,
    required this.email,
    // required this.favourites,
    // required this.bookmarks,
    // required this.reviews,
  });
}

bool _myList = false;
bool _donwloaded = false;
bool _finished = false;

class _UserState extends State<User> {
  UserData? _userData;

  @override
  void initState() {
    super.initState();
    // Call the method to fetch user data when the widget initializes
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final token = Constants.token;
      final response = await http.get(
        Uri.parse(Constants.my_profile_url),
        headers: {'Authorization': 'Bearer $token'},
      );
      //  print(response.body);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        String msg = responseData['message'];
        if (msg == "Success") {
          print(responseData['data']['user']['username']);
          final userData = UserData(
            username: responseData['data']['user']['username'],
            email: responseData['data']['user']['email'],
            // favourites:
            //     List<String>.from(responseData['data']['user']['favourites']),
            // bookmarks:
            //     List<String>.from(responseData['data']['user']['bookmarks,']),
            // reviews:
            //     List<String>.from(responseData['data']['user']['reviews,']),
          );
          print(userData.email);
          setState(() {
            _userData = userData;
          });
        }
      } else {
        throw Exception('Failed to load user data');
      }
    } catch (error) {
      print('Error fetching user data: $error');
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, p, child) {
        var profile = p.profileResult.profileModel!.data!.user;
        if (p.dataLoaded == true) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                title: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/tomo.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yusef Hassan', // Display username if available
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          Text(
                            'yusefhasan1321@gmail.com', // Display email if available
                            style: TextStyle(
                                color: Colors.grey, fontSize: 12, height: 1),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                backgroundColor: Colors.blue[100],
              ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 25, 8, 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('🎈  ${profile!.favourites!.length!}');
                            setState(() {
                              _myList = true;
                              _donwloaded = false;
                              _finished = false;
                              print(_myList);
                              print('list');
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (_myList)
                                    ? Color(0xff53c0ef)
                                    : Color(0xffe4f6fc),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 0.1,
                                      blurRadius: 0.1,
                                      color: Colors.black26,
                                      offset: Offset(0, 3))
                                ]),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Color(0xff2b4373),
                                ),
                                // Text(_userData!.favourites.length.toString(),
                                //     style: TextStyle(
                                //         color: Color(0xff2b4373), fontSize: 18)),
                                Text(
                                  'قائمتي',
                                  style: TextStyle(
                                      color: Color(0xff2b4373), fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('BookMarks :${profile!.bookmarks!.length}');
                            setState(() {
                              _myList = false;
                              _donwloaded = true;
                              _finished = false;
                              print(_myList);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: _donwloaded
                                    ? Color(0xff53c0ef)
                                    : Color(0xffe4f6fc),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 0.1,
                                      blurRadius: 0.1,
                                      color: Colors.black26,
                                      offset: Offset(0, 3))
                                ]),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.download,
                                  color: Color(0xff2b4373),
                                ),
                                // TODO: Add bookmarks section
                                // Text(_userData!.bookmarks.length.toString(),
                                //     style: TextStyle(
                                //         color: Color(0xff2b4373), fontSize: 18)),
                                Text(
                                  'الداونلود',
                                  style: TextStyle(
                                      color: Color(0xff2b4373), fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _myList = false;
                              _donwloaded = false;
                              _finished = true;
                              print(_myList);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: _finished
                                    ? Color(0xff53c0ef)
                                    : Color(0xffe4f6fc),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 0.1,
                                      blurRadius: 0.1,
                                      color: Colors.black26,
                                      offset: Offset(0, 3))
                                ]),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.book_rounded,
                                  color: Color(0xff2b4373),
                                ),
                                // Text(_userData!.reviews.length.toString(),
                                //     style: TextStyle(
                                //         color: Color(0xff2b4373), fontSize: 18)),
                                Text(
                                  'المنتهي',
                                  style: TextStyle(
                                      color: Color(0xff2b4373), fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Visibility(
                          visible: _myList,
                          child: Container(
                            //color: Colors.red,
                            height: MediaQuery.of(context).size.height * 0.65,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                itemCount: profile!.favourites!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  if (profile.favourites!.length == null) {
                                    return Center();
                                  } else {
                                    return MainBooksList(
                                      author: profile.favourites![index].book!
                                          .author!.nameEn!,
                                      category: profile.favourites![index].book!
                                          .category!.nameEn!,
                                      title: profile
                                          .favourites![index].book!.titleEn!,
                                    );
                                  }
                                }),
                          )),
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Visibility(
                        visible: _donwloaded,
                        child: ListView.builder(
                            itemCount: profile!.favourites!.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (profile.favourites!.length == null) {
                                return Center();
                              } else {
                                return MainBooksList(
                                  author: profile
                                      .favourites![index].book!.author!.nameEn!,
                                  category: profile.favourites![index].book!
                                      .category!.nameEn!,
                                  title:
                                      profile.favourites![index].book!.titleEn!,
                                );
                              }
                            }),
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Visibility(
                        visible: _finished,
                        child: SingleChildScrollView(
                          child: Center(),
                        ),
                      ),
                    ),
                    // TabBar(
                    //   padding: EdgeInsets.zero,
                    //   labelPadding: EdgeInsets.zero,
                    //   labelColor: Colors.blueAccent,
                    //   tabs: [
                    //     Container(
                    //       width: double.infinity,
                    //       color: Colors.brown,
                    //       child: Column(
                    //         children: [
                    //           Icon(Icons.favorite),
                    //           Text('قائمتي' , style: TextStyle(color: Colors.blue, fontSize: 18),),
                    //         ],
                    //       ),
                    //     ),
                    //     Column(
                    //       children: [
                    //         Icon(Icons.favorite),
                    //         Text('قائمتي' , style: TextStyle(color: Colors.blue, fontSize: 18),),
                    //       ],
                    //     ),
                    //     Column(
                    //       children: [
                    //         Icon(Icons.favorite),
                    //         Text('قائمتي' , style: TextStyle(color: Colors.blue, fontSize: 18),),
                    //       ],
                    //     ),
                    //   ],
                    //   controller: _tabController,
                    // ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
