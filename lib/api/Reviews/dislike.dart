import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';

Future<void> dislikeReview() async {
  // Define your base URL
  final String baseUrl = Constants.base_url;

  // Define the review ID
  final int reviewId = 1;

  // Define the endpoint
  final String endpoint = "/reviews/dislike/$reviewId";

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
      print('Review disliked successfully.');
    } else {
      // Handle other status codes
      print('Failed to dislike review. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Handle errors
    print('Error disliking review: $e');
  }
}

// Call the function to dislike a review
//dislikeReview();
