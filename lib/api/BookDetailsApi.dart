import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';

// TODO: remove not implemented fields
class BookDetails {
  final int id;
  final String titleAr;
  final String titleEn;
  final String slug;
  final String descrAr;
  final String descrEn;
  final String summaryAr;
  final String summaryEn;
  final double price;
  final String img;
  final String edition;
  final int pages;
  final Category category;
  final Author author;
  final Reviews reviews;

  BookDetails({
    required this.id,
    required this.titleAr,
    required this.titleEn,
    required this.slug,
    required this.descrAr,
    required this.descrEn,
    required this.summaryAr,
    required this.summaryEn,
    required this.price,
    required this.img,
    required this.edition,
    required this.pages,
    required this.category,
    required this.author,
    required this.reviews,
  });
}

class Category {
  final int id;
  final String nameAr;
  final String nameEn;
  final String slug;

  Category({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.slug,
  });
}

class Author {
  final int id;
  final String nameAr;
  final String nameEn;
  final String slug;
  final String img;
  final String bioAr;
  final String bioEn;

  Author({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.slug,
    required this.img,
    required this.bioAr,
    required this.bioEn,
  });
}

class Reviews {
  final dynamic rate;

  Reviews({required this.rate});
}

Future<BookDetails?> fetchBookDetails(String slug) async {
  try {
    var response = await http.get(Uri.parse(Constants.book_details_url +
        '/' +
        "cum-qui-aspernatur-dolor-id-eum-ut-tempore"));
    //await http.get(Uri.parse(Constants.book_details_url + '/' + slug));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data']['book'];
      return BookDetails(
        id: data['id'],
        titleAr: data['title_ar'],
        titleEn: data['title_en'],
        slug: data['slug'],
        descrAr: data['descr_ar'],
        descrEn: data['descr_en'],
        summaryAr: data['summary_ar'],
        summaryEn: data['summary_en'],
        price: double.parse(data['price'].toString()),
        img: data['img'],
        edition: data['edition'],
        pages: data['pages'],
        category: Category(
          id: data['category']['id'],
          nameAr: data['category']['name_ar'],
          nameEn: data['category']['name_en'],
          slug: data['category']['slug'],
        ),
        author: Author(
          id: data['author']['id'],
          nameAr: data['author']['name_ar'],
          nameEn: data['author']['name_en'],
          slug: data['author']['slug'],
          img: data['author']['img'],
          bioAr: data['author']['bio_ar'],
          bioEn: data['author']['bio_en'],
        ),
        reviews: Reviews(rate: data['reviews'] ?? ['rate']),
      );
    } else {
      print('Failed to fetch book details: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Error fetching book details: $error');
    return null;
  }
}
