import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';

Future<void> likeReview() async {
  // Define your base URL
  final String baseUrl = Constants.base_url;

  // Define the review ID
  final int reviewId = 4;

  // Define the endpoint
  final String endpoint = "/reviews/like/$reviewId";

  // Construct the URL
  final Uri url = Uri.parse(baseUrl + endpoint);

  // Make the PATCH request
  try {
    final http.Response response = await http.patch(
      url,
      headers: <String, String>{
        // Add any headers if needed
      },
    );

    if (response.statusCode == 200) {
      // Handle success
      print('Review liked successfully.');
    } else {
      // Handle other status codes
      print('Failed to like review. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle errors
    print('Error liking review: $e');
  }
}

// Call the function to like a review
//likeReview();
