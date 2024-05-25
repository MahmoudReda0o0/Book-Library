import 'package:flutter/material.dart';
import 'package:readify/Api%20Http/single%20record/get%20profile/profileFetchApi.dart';

//enum prfileStates{initial , loading , success , fail }

class ProfileProvider extends ChangeNotifier {
  bool dataLoaded = false;
  ProfileResult profileResult = ProfileResult();
  Future getData() async {
    profileResult = await GetProfileFetchApi.FetchApi();
    if (profileResult.hasData == true) {
      print('Provider Data Loaded');
      dataLoaded = true;
      notifyListeners();
    } else {
      print('Provder Data Failed');
      dataLoaded = false;
      notifyListeners();
    }
  }
}
