import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';

Future<void> addToFavorites(String token) async {
  // Define your base URL
  final String baseUrl = Constants.base_url;

  // Define the favorite ID
  final int favoriteId = 8;

  // Construct the URL
  final Uri url = Uri.parse(baseUrl + "/favourites/add/$favoriteId");

  // Make the POST request
  try {
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Authorization': 'Bearer $token', // Set authorization header
        'Accept': 'application/json', // Set accept header
      },
    );

    if (response.statusCode == 200) {
      // Handle success
      print('Added to favorites successfully.');
    } else {
      // Handle other status codes
      print('Failed to add to favorites. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle errors
    print('Error adding to favorites: $e');
  }
}

// Call the function to add to favorites
//addToFavorites('<YOUR_TOKEN>'); // Replace '<YOUR_TOKEN>' with the actual token
