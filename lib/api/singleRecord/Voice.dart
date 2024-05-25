import 'package:http/http.dart' as http;
import 'package:readify/Constants.dart';

Future<void> fetchVoiceData() async {
  final String baseuri = Constants.base_url;
  final String voiceid = '';

  try {
    final response = await http.get(Uri.parse(baseuri + voiceid));

    if (response.statusCode == 200) {
      // Handle successful response
      print('Response: ${response.body}');
      // Here you can parse the response body and handle it accordingly
    } else {
      // Handle error response
      print('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle network errors
    print('Error: $e');
  }
}

// TODO: Call fetchData() function where you want to fetch the data
// TODO: fetchData();


