import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';

Future<void> removeFromMyBooks(String token) async {
  // Define your base URL
  final String baseUrl = Constants.base_url;

  // Define the book ID
  final int bookId = 1;

  // Construct the URL
  final Uri url = Uri.parse(baseUrl + "/myBooks/remove/$bookId");

  // Make the DELETE request
  try {
    final http.Response response = await http.delete(
      url,
      headers: <String, String>{
        'Authorization': 'Bearer $token', // Set authorization header
        'Accept': 'application/json', // Set accept header
      },
    );

    if (response.statusCode == 200) {
      // Handle success
      print('Book removed from my books successfully.');
    } else {
      // Handle other status codes
      print(
          'Failed to remove book from my books. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle errors
    print('Error removing book from my books: $e');
  }
}

// Call the function to remove a book from my books
//removeFromMyBooks('<YOUR_TOKEN>'); // Replace '<YOUR_TOKEN>' with the actual token
