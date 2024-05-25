import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';

Future<void> fetchFavorites(String token) async {
  // Construct the URL
  final Uri url = Uri.parse(Constants.myFavorites);

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
      print('Favorites fetched successfully:');
      print(response.body); // Response body contains the fetched data
    } else {
      // Handle other status codes
      print('Failed to fetch favorites. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle errors
    print('Error fetching favorites: $e');
  }
}

// Call the function to fetch favorites
//fetchFavorites('<YOUR_TOKEN>'); // Replace '<YOUR_TOKEN>' with the actual token
