import 'package:coworking_app/Controller/Login_Api.dart';
import 'package:coworking_app/View/MainHome.dart';
import 'package:coworking_app/View/account_creation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

final TextEditingController userId = TextEditingController();

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 44,
                        width: 44,
                        child: Image.asset("Assets/DF_Icon (2) 1.png"),
                      ),
                      Text(
                        "Co-working",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                            color: const Color.fromRGBO(0, 0, 0, 1)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 90,
              ),
              Text(
                "Mobile number or Email",
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
                  controller: userId,
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color.fromRGBO(0, 0, 0, .7)),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Password",
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
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.visibility_off_outlined,
                        color: Color.fromRGBO(168, 168, 168, 1),
                      )),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color.fromRGBO(0, 0, 0, .7)),
                ),
              ),
              const SizedBox(
                height: 300,
              ),
              GestureDetector(
                onTap: () {
                  LoginAPI.loginAPIModel(userId.text);
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
                    "Log In",
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
                    "New user?",
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
                              builder: (context) => const CreateAccountPage()));
                    },
                    child: Text(
                      " Create an account",
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
