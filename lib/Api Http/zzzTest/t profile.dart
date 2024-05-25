import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readify/Api%20Http/my%20favourites/my_favourites_provider.dart';
import 'package:readify/Api%20Http/single%20record/get%20profile/profileProvider.dart';

class TestProfile extends StatefulWidget {
  const TestProfile({super.key});

  @override
  State<TestProfile> createState() => _TestProfileState();
}

class _TestProfileState extends State<TestProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<ProfileProvider, MyFavouritesProvider>(
          builder: (context, profileProvider, favouritesProvider, child) {
        var profile = profileProvider.profileResult.profileModel;
        var favourtes = favouritesProvider.getFavouritesResult.favouritesModel;
        if (profileProvider.dataLoaded == true) {
          return Column(
            children: [
              Text('User name : ${profile!.data!.user!.username}'),
              Text('email${profile.data!.user!.email}'),
              Text('${profile.message}'),
              Text('${profile.status}'),
              Text('${profile.data!.user!.createdAt}'),
              Divider(
                color: Colors.black,
              ),
              // Text('Favourites : ${favourtes!.message}'),
              // Text('${favourtes!.status}'),
              // Text('${favourtes.data!.favourites![0].book!.author!.bioEn}')
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
