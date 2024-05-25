class MyBookModel {
  bool? status;
  String? message;
  Data? data;

  MyBookModel({this.status, this.message, this.data});

  MyBookModel.fromJson(Map<String, dynamic> json) {
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
  MyBooks? myBooks;

  Data({this.myBooks});

  Data.fromJson(Map<String, dynamic> json) {
    myBooks = json['my_books'] != null
        ? new MyBooks.fromJson(json['my_books'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myBooks != null) {
      data['my_books'] = this.myBooks!.toJson();
    }
    return data;
  }
}

class MyBooks {
  List<ReadingBooks>? readingBooks;
  List<Null>? finishedBooks;

  MyBooks({this.readingBooks, this.finishedBooks});

  MyBooks.fromJson(Map<String, dynamic> json) {
    if (json['reading_books'] != null) {
      readingBooks = <ReadingBooks>[];
      json['reading_books'].forEach((v) {
        readingBooks!.add(new ReadingBooks.fromJson(v));
      });
    }
    if (json['finished_books'] != null) {
      finishedBooks = <Null>[];
      json['finished_books'].forEach((v) {
        //finishedBooks!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.readingBooks != null) {
      data['reading_books'] =
          this.readingBooks!.map((v) => v.toJson()).toList();
    }
    if (this.finishedBooks != null) {
      // data['finished_books'] =
      //     this.finishedBooks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReadingBooks {
  int? id;
  Book? book;
  int? progress;
  int? stopPage;
  String? stopTiming;
  String? status;
  String? createdAt;

  ReadingBooks(
      {this.id,
      this.book,
      this.progress,
      this.stopPage,
      this.stopTiming,
      this.status,
      this.createdAt});

  ReadingBooks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    book = json['book'] != null ? new Book.fromJson(json['book']) : null;
    progress = json['progress'];
    stopPage = json['stop_page'];
    stopTiming = json['stop_timing'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.book != null) {
      data['book'] = this.book!.toJson();
    }
    data['progress'] = this.progress;
    data['stop_page'] = this.stopPage;
    data['stop_timing'] = this.stopTiming;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Book {
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

  Book(
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

  Book.fromJson(Map<String, dynamic> json) {
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

class Category {
  int? id;
  String? nameAr;
  String? nameEn;
  String? slug;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.slug,
      this.createdAt,
      this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

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