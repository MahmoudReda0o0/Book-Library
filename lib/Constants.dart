class Constants {
  static const String base_url = 'http://127.0.0.1:8000/api';
  // static const String base_url = 'http://10.0.2.2:8000/api';
  static const String login_url = '$base_url/login';
  static const String logout_url = '$base_url/logout';
  static const String register_url = '$base_url/register/';
  static const String pass_change_url = '$base_url/password/change';
  static const String token =
      '3|MPpKDH6wUlUQ4C5HEfGTffSGNSx4Q31iJasI0r8yf251954f';
  static const String z_token =
      '13|qy3jvYPNAABats6N60hfXiNDeKsDWjNHEdCQHGvN4edc31a9'; // returned from verfication endpoint

  static const String book_details_url = '$base_url/book';
  static const String rand_book_slug =
      "cum-qui-aspernatur-dolor-id-eum-ut-tempore";
  static const String bookSlug =
      'voluptatem-quas-expedita-exercitationem-unde-necessitatibus-totam-iusto';

  static const String my_profile_url = '$base_url/profile/';
  static const String user_profile_url = '$base_url/user/michaela30';
  static const int toast_time =
      1000; // time in milliseconds used in SnackBars and Fluttertoast messages
  static const String category_url =
      '$base_url/category/consequatur-aspernatur-ut-totam-ratione-explicabo';
  static const String voice_url = '$base_url/voice/Gannon Patton';
  static const String books = '$base_url/search/books?name=s';
  static const String addReview = '$base_url/reviews/add/1';
  static const String likeReview = '$base_url/reviews/like/4';
  static const String dislikeReview = '$base_url/reviews/dislike/1';
  static const String myFavorites = '$base_url/favourites';
  static const String myBooks = '$base_url/myBooks/';
  static const String recommend = '$base_url/recommend/';
  static const String search = '$base_url/search/books?name=';
  //static const String addFavorites = '$base_url//favourites/add/8';
}
