import 'package:coworking_app/Controller/DialogData.dart';
import 'package:coworking_app/Controller/GetAvailableApi.dart';
import 'package:coworking_app/View/MainHome.dart';
import 'package:coworking_app/View/Slot&Time.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class AvaliableDeskPage extends StatefulWidget {
  const AvaliableDeskPage({super.key});
  @override
  State createState() => _AvaliableDeskPageState();
}

class _AvaliableDeskPageState extends State {
  int selectedSeat = -1;

  void selectSeat(int seatNumber) {
    setState(() {
      selectedSeat = seatNumber;
    });
  }

  bool isSeatBooked(int seatNumber) {
    return GetAvailabilityAPI.activeAvaible.contains(seatNumber);
  }

  Border? getBorder(bool isBooked) {
    if (isBooked) {
    } else {
      return Border.all(color: const Color.fromRGBO(199, 207, 252, 1));
    }
  }

  List<String> slots = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
  ];

  int seatID = 0;

  Widget? check() {
    if (DialogData.toggle) {
      return const Text("Available desks");
    } else {
      return const Text("Available rooms");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: check(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "${DialogData.datesData[0]}",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  DialogData.timeSlots[0],
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: slots.length,
                itemBuilder: (context, index) {
                  int seatNumber = index + 1;
                  bool isBooked = isSeatBooked(seatNumber);
                  bool isSelected = seatNumber == selectedSeat;

                  Color color;
                  if (isBooked) {
                    color = const Color.fromRGBO(227, 227, 227, 1);
                  } else if (isSelected) {
                    color = const Color.fromRGBO(77, 96, 209, 1);
                  } else {
                    color = const Color.fromRGBO(240, 245, 255, 1);
                  }

                  return GestureDetector(
                    onTap: () {
                      seatID = seatNumber;
                      print("deskid : $seatID");
                      if (!isBooked) {
                        selectSeat(seatNumber);
                      }
                    },
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: color,
                        border: getBorder(isBooked),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Center(
                        child: Text(
                          slots[index],
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: isBooked
                                ? Colors.white
                                : isSelected
                                    ? const Color.fromRGBO(255, 255, 255, 1)
                                    : const Color.fromRGBO(91, 97, 128, 1),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                DialogData.addDeskId(seatID);

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const DialogBox();
                  },
                );
              },
              style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(380, 60)),
                  backgroundColor: const WidgetStatePropertyAll(
                    Color.fromRGBO(81, 103, 235, 1),
                  ),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              child: Text(
                'Book Desk',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Confirm booking',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.cancel_sharp),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                "Desk ID :${DialogData.deskId}",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 70),
              Text(
                "Desk : ${DialogData.deskId[0]}",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                "Slot : ${DialogData.datesData[0]}",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                " ${DialogData.timeSlots[0]}",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MainPage()));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromRGBO(25, 173, 30, 1),
                    content: Text('You have successfully booked your Desk'),
                  ),
                );
              },
              style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(159, 34)),
                  backgroundColor: const WidgetStatePropertyAll(
                    Color.fromRGBO(81, 103, 235, 1),
                  ),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              child: Text(
                'Confirm',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
