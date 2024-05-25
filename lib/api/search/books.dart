import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';

Future<void> fetchBooks(String searchTerm) async {
  final searchUrl = Constants.books;

  try {
    final response = await http.get(Uri.parse(searchUrl));

    if (response.statusCode == 200) {
      // API call successful
      // Parse the response data (response.body) here
    } else {
      // API call failed
      throw Exception('Failed to load books');
    }
  } catch (e) {
    // Handle exceptions
    print('Error: $e');
  }
}
