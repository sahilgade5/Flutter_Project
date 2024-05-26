import 'dart:convert';
import 'package:http/http.dart' as http;

class GetAvailabilityAPI {
  static List desk = [];
  static List<int> activeAvaible = [];

  static void get_availability() async {
    Uri url = Uri.parse(
        "https://demo0413095.mockable.io/digitalflake/api/get_availability?date=2023-05-01&slot_id=2&type=1");
    http.Response response = await http.get(url);
    var responseData = json.decode(response.body);

    desk = responseData['availability'];

    activeAvaible = desk
        .where((element) => element["workspace_active"] == true)
        .map<int>((slot) => slot['workspace_id'])
        .toList();
  }
}