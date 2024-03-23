import 'package:bus_app/screens/selection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 207, 255, 255),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'SLTB Bus Booking System',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 24, 39, 92),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 24, 39, 92),
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Text(
                    'Online bus seat booking system',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 24, 39, 92),
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Image.asset(
                  "assets/logo.png",
                  width: double.infinity,
                ),
              ),
              Image.asset("assets/placeholder.png"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const SelectionScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: const EdgeInsets.all(17),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: const Color.fromARGB(255, 24, 39, 92),
                  ),
                  child: const Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "Outfit-Regular",
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
