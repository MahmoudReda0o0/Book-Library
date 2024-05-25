class MyProfile {
  bool? status;
  String? message;
  Data? data;

  MyProfile({this.status, this.message, this.data});

  MyProfile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    // if (this.data != null) {
    //   data['data'] = this.data!.toJson();
    // }
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.user != null) {
  //     data['user'] = this.user!.toJson();
  //   }
  //   return data;
  // }
}

class User {
  int? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? image;
  Null emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  List<Null>? favourites;
  List<Null>? bookmarks;
  List<Null>? reviews;
  String? language;

  User(
      {this.id,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.image,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      // this.favourites,
      // this.bookmarks,
      // this.reviews,
      this.language});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    image = json['image'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // if (json['favourites'] != null) {
    //   favourites = <Null>[];
    //   json['favourites'].forEach((v) {
    //     favourites!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['bookmarks'] != null) {
    //   bookmarks = <Null>[];
    //   json['bookmarks'].forEach((v) {
    //     bookmarks!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['reviews'] != null) {
    //   reviews = <Null>[];
    //   json['reviews'].forEach((v) {
    //     reviews!.add(new Null.fromJson(v));
    //   });
    // }
    language = json['language'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['username'] = this.username;
  //   data['first_name'] = this.firstName;
  //   data['last_name'] = this.lastName;
  //   data['email'] = this.email;
  //   data['image'] = this.image;
  //   data['email_verified_at'] = this.emailVerifiedAt;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   // if (this.favourites != null) {
  //   //   data['favourites'] = this.favourites!.map((v) => v.toJson()).toList();
  //   // }
  //   // if (this.bookmarks != null) {
  //   //   data['bookmarks'] = this.bookmarks!.map((v) => v.toJson()).toList();
  //   // }
  //   // if (this.reviews != null) {
  //   //   data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
  //   // }
  //   // data['language'] = this.language;
  //   // return data;
  // }
}
