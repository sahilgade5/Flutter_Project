import 'package:coworking_app/View/MainHome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State createState() => _BookingState();
}

class _BookingState extends State {
  List<dynamic> getList = MainPage.booking;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Booking history",
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 20),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView.builder(
            itemCount: MainPage.booking.length,
            itemBuilder: (context, index) {
              return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(254, 247, 255, 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Desk ID",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color.fromRGBO(137, 137, 137, 1)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Name",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color.fromRGBO(137, 137, 137, 1)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Booked on",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color.fromRGBO(137, 137, 137, 1)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "  :  ",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color.fromRGBO(137, 137, 137, 1)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "  :  ",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color.fromRGBO(137, 137, 137, 1)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "  :  ",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color.fromRGBO(137, 137, 137, 1)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${MainPage.booking[index]['workspace_id']}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color.fromRGBO(30, 30, 30, 1)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${MainPage.booking[index]['workspace_name']}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color.fromRGBO(30, 30, 30, 1)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${MainPage.booking[index]['booking_date']}",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color.fromRGBO(30, 30, 30, 1)),
                          ),
                        ],
                      )
                    ],
                  ));
            },
          ),
        ));
  }
}
