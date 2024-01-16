import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> verifyEmail(String email) async {
  const apiKey = '516ab40faaec419288e3d2390d74ccf4';
  const url = 'https://api.zerobounce.net/v2/validate?api_key=';

  final response = await http.post(
    Uri.parse(url),
    body: {
      'email': email,
      'api_key': apiKey,
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    // Check the response from ZeroBounce
    return data['status'] == 'valid';
  } else {
    // Handle errors
    return false;
  }
}
