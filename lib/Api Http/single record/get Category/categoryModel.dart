class CategoryModel {
  bool? status;
  String? message;
  Data? data;

  CategoryModel({this.status, this.message, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Category? category;

  Data({this.category});

  Data.fromJson(Map<String, dynamic> json) {
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? nameAr;
  String? nameEn;
  String? slug;
  String? createdAt;
  String? updatedAt;
  List<Books>? books;

  Category(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.slug,
      this.createdAt,
      this.updatedAt,
      this.books});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(new Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.books != null) {
      data['books'] = this.books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  int? id;
  String? titleAr;
  String? titleEn;
  String? slug;
  String? descrAr;
  String? descrEn;
  String? summaryAr;
  String? summaryEn;
  String? price;
  String? img;
  String? edition;
  int? pages;
  Category? category;
  Author? author;
  List<Reviews>? reviews;
  String? createdAt;
  String? updatedAt;

  Books(
      {this.id,
      this.titleAr,
      this.titleEn,
      this.slug,
      this.descrAr,
      this.descrEn,
      this.summaryAr,
      this.summaryEn,
      this.price,
      this.img,
      this.edition,
      this.pages,
      this.category,
      this.author,
      this.reviews,
      this.createdAt,
      this.updatedAt});

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    slug = json['slug'];
    descrAr = json['descr_ar'];
    descrEn = json['descr_en'];
    summaryAr = json['summary_ar'];
    summaryEn = json['summary_en'];
    price = json['price'];
    img = json['img'];
    edition = json['edition'];
    pages = json['pages'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_ar'] = this.titleAr;
    data['title_en'] = this.titleEn;
    data['slug'] = this.slug;
    data['descr_ar'] = this.descrAr;
    data['descr_en'] = this.descrEn;
    data['summary_ar'] = this.summaryAr;
    data['summary_en'] = this.summaryEn;
    data['price'] = this.price;
    data['img'] = this.img;
    data['edition'] = this.edition;
    data['pages'] = this.pages;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

// class Category {
//   int? id;
//   String? nameAr;
//   String? nameEn;
//   String? slug;
//   String? createdAt;
//   String? updatedAt;

//   Category(
//       {this.id,
//       this.nameAr,
//       this.nameEn,
//       this.slug,
//       this.createdAt,
//       this.updatedAt});

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nameAr = json['name_ar'];
//     nameEn = json['name_en'];
//     slug = json['slug'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name_ar'] = this.nameAr;
//     data['name_en'] = this.nameEn;
//     data['slug'] = this.slug;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

class Author {
  int? id;
  String? nameAr;
  String? nameEn;
  String? slug;
  String? img;
  String? bioAr;
  String? bioEn;
  String? createdAt;
  String? updatedAt;

  Author(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.slug,
      this.img,
      this.bioAr,
      this.bioEn,
      this.createdAt,
      this.updatedAt});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    slug = json['slug'];
    img = json['img'];
    bioAr = json['bio_ar'];
    bioEn = json['bio_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['slug'] = this.slug;
    data['img'] = this.img;
    data['bio_ar'] = this.bioAr;
    data['bio_en'] = this.bioEn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Reviews {
  int? id;
  String? rate;
  int? likes;
  int? dislikes;
  String? content;
  int? isSpoiler;
  User? user;
  String? createdAt;

  Reviews(
      {this.id,
      this.rate,
      this.likes,
      this.dislikes,
      this.content,
      this.isSpoiler,
      this.user,
      this.createdAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    likes = json['likes'];
    dislikes = json['dislikes'];
    content = json['content'];
    isSpoiler = json['is_spoiler'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rate'] = this.rate;
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    data['content'] = this.content;
    data['is_spoiler'] = this.isSpoiler;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class User {
  String? firstName;
  String? lastName;
  String? username;
  String? image;

  User({this.firstName, this.lastName, this.username, this.image});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['image'] = this.image;
    return data;
  }
}
