import 'dart:convert';
import 'package:http/http.dart' as http;

class GetSlotsAPI {
  static List slots = [];
  static List<int> activeSlotIds = [];

  static void getSlots() async {
    Uri url = Uri.parse(
        "https://demo0413095.mockable.io/digitalflake/api/get_slots?date=2023-05-01");
    http.Response response = await http.get(url);
    var responseData = json.decode(response.body);
    slots = responseData['slots'];

    activeSlotIds = slots
        .where((slot) => slot["slot_active"] == true)
        .map<int>((slot) => slot["slot_id"])
        .toList();
  }
}