import 'package:intl/intl.dart';

class DialogData {
  static bool toggle = false;

  static List date = [];

  static List time = [];
  static List deskId = [];
  static String? str;

  static List datesData = [];

  static List<String> data = [
    "10:00AM - 11:00AM",
    "11:00AM - 12:00PM",
    "01:00PM - 02:00PM",
    "02:00PM - 03:00PM",
    "04:00PM - 05:00PM",
    "05:00PM - 06:00PM",
    "06:00PM - 07:00PM",
    "07:00PM - 08:00PM",
    "08:00PM - 09:00PM",
    "09:00PM - 10:00PM"
  ];

  static void addTime(int seatNumber) {
    time.add(seatNumber);
  }

  static void addDeskId(int seatNumber) {
    deskId.add(seatNumber);
  }

  static List<String> timeSlots = [];


static void addDate(DateTime date) {
    String formattedDate = DateFormat('E dd MMM').format(date);
    datesData.add(formattedDate);
  }


  static void addTimeSlot(String timeSlot) {
    timeSlots.add(timeSlot);
  }
}