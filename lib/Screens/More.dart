// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:readify/Constants.dart';

import '../api/singleRecord/my profile/myProfile.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  Future<void> logout(String userToken) async {
    try {
      var response = await http.post(
        Uri.parse(Constants.logout_url),
        headers: {
          'Authorization': 'Bearer $userToken',
        },
      );
      // print(response.body);
      var responseData = json.decode(response.body);
      String msg = responseData['message'];
      // Check the response status code
      if (response.statusCode == 200) {
        if (msg == "Success") {
          print('Logout successful');
        }
      } else {
        // Logout failed
        print('Logout failed: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors that occur during the logout process
      print('Error occurred during logout: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Text(
                    'الإعدادات',
                    style: TextStyle(
                      color: Color(0xff5EC9EF),
                    ),
                  ),
                )
              ],
            ),
            backgroundColor: Colors.white,
          ),
          body: ListView(
            children: ListTile.divideTiles(
                //         <-- ListTile.divideTiles
                color: Color(0xff5EC9EF),
                context: context,
                tiles: [
                  ListTile(
                    onTap: () {
                      ApiMyProflie.fetchMyProfile();
                      print('object');
                    },
                    trailing: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xff5EC9EF),
                    ),
                    title: Text(
                      'معلومات الحساب',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff5EC9EF),
                      ),
                    ),
                  ),
                  ListTile(
                    trailing: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xff5EC9EF),
                    ),
                    title: Text(
                      'قيم التطبيق',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff5EC9EF),
                      ),
                    ),
                  ),
                  ListTile(
                    trailing: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xff5EC9EF),
                    ),
                    title: Text(
                      'معلومات عنا',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff5EC9EF),
                      ),
                    ),
                  ),
                  ListTile(
                    trailing: Text(
                      '0.0.1',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff5EC9EF),
                      ),
                    ),
                    title: Text(
                      'الإصدار الحالي',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff5EC9EF),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      logout(Constants.token);
                    },
                    child: Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff5EC9EF),
                      ),
                    ),
                  )
                ]).toList(),
          ),
        ));
  }
}
