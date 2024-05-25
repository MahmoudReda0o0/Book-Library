import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';
import 'package:readify/api/singleRecord/my%20profile/myProfileModel.dart';

class ApiMyProflie {
  static Future<dynamic> fetchMyProfile() async {
    String token = '5|EJpIzWTU9RpasdvLrzMyyx4yXgeBVvrQH4NRjWr96d3d9440';
    final profileUrl = Uri.parse(Constants.my_profile_url);

    try {
      final http.Response response = await http.get(
        profileUrl,
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        MyProfile myProfile = MyProfile.fromJson(jsonDecode(response.body));
        print('my profile:${myProfile.message}');
        print(myProfile);
        return myProfile;
      } else {
        // API call failed
        throw Exception('Failed to load user profile');
      }
    } catch (e) {
      print('error api yousef');
      // Handle exceptions
      print('fetching: $e');
    }
  }
}
