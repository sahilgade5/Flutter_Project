import 'package:coworking_app/Controller/ApiCreation.dart';
import 'package:coworking_app/View/MainHome.dart';
import 'package:coworking_app/View/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

final TextEditingController emailId = TextEditingController();

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                "Create an Account",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                "Full name",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 249, 249, 1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromRGBO(218, 218, 218, 1))),
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color.fromRGBO(0, 0, 0, .7)),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Mobile number",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 249, 249, 1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromRGBO(218, 218, 218, 1))),
                child: TextFormField(
                  controller: emailId,
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color.fromRGBO(0, 0, 0, .7)),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Email ID",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 249, 249, 1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromRGBO(218, 218, 218, 1))),
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color.fromRGBO(0, 0, 0, .7)),
                ),
              ),
              const SizedBox(
                height: 280,
              ),
              GestureDetector(
                onTap: () {
                    CreateAPI.createAnAccountAPI(emailId.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(81, 103, 235, 1),
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Text(
                    "Create an account",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: const Color.fromRGBO(255, 255, 255, 1)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Existing user?",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color.fromRGBO(98, 98, 98, 1)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Loginpage()));
                    },
                    child: Text(
                      "Log In",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color.fromARGB(255, 0, 21, 255)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
