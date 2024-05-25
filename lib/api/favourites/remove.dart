import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';

Future<void> removeFromFavorites(String token) async {
  // Define your base URL
  final String baseUrl = Constants.base_url;

  // Define the favorite ID
  final int favoriteId = 3;

  // Construct the URL
  final Uri url = Uri.parse(baseUrl + "/favourites/remove/$favoriteId");

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
      print('Removed from favorites successfully.');
    } else {
      // Handle other status codes
      print(
          'Failed to remove from favorites. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle errors
    print('Error removing from favorites: $e');
  }
}

// Call the function to remove from favorites
//removeFromFavorites('<YOUR_TOKEN>'); // Replace '<YOUR_TOKEN>' with the actual token
