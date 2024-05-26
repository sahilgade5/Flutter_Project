import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginAPI {
  static void loginAPIModel(String email) async {
    final url =
        Uri.parse("https://demo0413095.mockable.io/digitalflake/api/login");

    Map requestBody = {
      'user_id': email,
      'message': "Signed in successfull",
    };
    var response = await http.post(url,
        body: requestBody);

    if (response.statusCode == 200) {
      print("Response Body: ${response.body}");
    } else {
      print("Error: ${response.body}");
    }
  }
}
