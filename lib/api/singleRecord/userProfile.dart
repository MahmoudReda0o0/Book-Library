import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';

Future<void> fetchUserProfile(String username) async {
  final profileUrl = Constants.user_profile_url;

  try {
    final response = await http.get(Uri.parse(profileUrl));

    if (response.statusCode == 200) {
      // API call successful
      // Parse the response data (response.body) here
      // Example:
      // final responseData = json.decode(response.body);
    } else {
      // API call failed
      throw Exception('Failed to load user profile');
    }
  } catch (e) {
    // Handle exceptions
    print('Error: $e');
  }
}

//TO DO : fetchUserProfile('michaela30');
