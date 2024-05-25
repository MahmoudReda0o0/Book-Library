import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';

Future<void> addReview() async {
  // Define your base URL
  final String baseUrl = Constants.base_url;

  // Define the endpoint
  final String endpoint = "/reviews/add/1";

  // Construct the URL
  final Uri url = Uri.parse(baseUrl + endpoint);

  // Example payload
  final Map<String, dynamic> payload = {
    // Add your request parameters here if needed
  };

  // Convert payload to JSON
  final String jsonString = jsonEncode(payload);

  // Make the POST request
  try {
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json', // Specify content type as JSON
        // Add any additional headers if needed
      },
      body: jsonString, // Set the request body
    );

    if (response.statusCode == 200) {
      // Handle success
      print('Review added successfully.');
    } else {
      // Handle other status codes
      print('Failed to add review. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle errors
    print('Error adding review: $e');
  }
}

// Call the function to add a review
//addReview();
