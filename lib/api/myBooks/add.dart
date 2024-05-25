import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';

Future<void> fetchMyBooks(String token) async {
  // Define your base URL
  final String baseUrl = Constants.base_url;

  // Construct the URL
  final Uri url = Uri.parse(baseUrl + "/api/myBooks");

  // Make the GET request
  try {
    final http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Authorization': 'Bearer $token', // Set authorization header
        'Accept': 'application/json', // Set accept header
      },
    );

    if (response.statusCode == 200) {
      // Handle success
      print('My books fetched successfully:');
      print(response.body); // Response body contains the fetched data
    } else {
      // Handle other status codes
      print('Failed to fetch my books. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle errors
    print('Error fetching my books: $e');
  }
}

// Call the function to fetch my books
//fetchMyBooks('<YOUR_TOKEN>'); // Replace '<YOUR_TOKEN>' with the actual token
