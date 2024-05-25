import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:readify/Api%20Http/single%20record/get%20profile/profileModel.dart';
import 'package:readify/Constants.dart';

class ProfileResult {
  bool? hasData;
  String? massage;
  ProfileModel? profileModel;
}

class GetProfileFetchApi {
  static Future<ProfileResult> FetchApi() async {
    final _url = Uri.parse('${Constants.my_profile_url}');
    ProfileResult profileResult = ProfileResult();
    try {
      final response = await http.get(
        _url,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );
      print('Profile Response Status Code : ${response.statusCode}');
      if (response.statusCode == 200) {
        profileResult.hasData = true;
        profileResult.massage = 'Profile Data Done';
        profileResult.profileModel =
            ProfileModel.fromJson(jsonDecode(response.body));
        print('${profileResult.profileModel!.data!.user!.username}');
        return profileResult;
      } else {
        profileResult.hasData = false;
        profileResult.massage = 'Profile Data Failed';
        return profileResult;
      }
    } catch (e) {
      profileResult.hasData = false;
      profileResult.massage = 'Catch Error $e';
      throw Exception('Catch Error $e');
    }
  }
}
