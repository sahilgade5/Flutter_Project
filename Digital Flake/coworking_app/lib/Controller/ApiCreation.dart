import 'package:http/http.dart' as http;

class CreateAPI {
  static void createAnAccountAPI(String email) async {
    final url = Uri.parse(
        "https://demo0413095.mockable.io/digitalflake/api/create_account");

    Map requestBody = {
      'user_id': email,
      'message': "Account created sucessfully",
    };

    var response = await http.post(url,
        body:requestBody);

    if (response.statusCode == 200) {
      print("Response Body: ${response.body}");
    } else {
      print("Error: ${response.statusCode}");
    }
  }
}