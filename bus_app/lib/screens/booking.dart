import 'dart:convert';

import 'package:bus_app/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class BookingScreen extends StatefulWidget {
  const BookingScreen({
    super.key,
    required this.from,
    required this.to,
    required this.date,
    required this.busName,
  });

  final String from;
  final String to;
  final String date;
  final String busName;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _form2 = GlobalKey<FormState>();
  String _enteredSheets = "";
  String _enteredNIC = "";
  String _enteredDescription = "";
  String _enteredUsername = "";
  var _isBooking = false;

  void _book() async {
    final isValid = _form2.currentState!.validate();

    if (!isValid) {
      return;
    }

    FocusScope.of(context).unfocus();
    _form2.currentState!.save();

    setState(() {
      _isBooking = true;
    });

    if (_enteredDescription == "") {
      _enteredDescription = "Not added.";
    }

    final url = Uri.https(
      "bus-booking-system-e2f65-default-rtdb.firebaseio.com",
      "booked-details.json",
    );
    final responce = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(
        {
          "user-ID": _enteredNIC,
          "user-name": _enteredUsername,
          "date": widget.date,
          "from": widget.from,
          "to": widget.to,
          "bus-name": widget.busName,
          "sheets-booked": _enteredSheets,
          "description": _enteredDescription,
        },
      ),
    );

    // ignore: avoid_print
    print(responce.statusCode);

    if (!context.mounted) {
      return;
    }

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => ResultsScreen(
          busNumber: widget.busName,
          userName: _enteredUsername,
          userNIC: _enteredNIC,
          date: widget.date,
          seatCount: _enteredSheets,
        ),
      ),
    );

    setState(() {
      _isBooking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book your sheets"),
        backgroundColor: const Color.fromARGB(255, 207, 255, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 207, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                widget.busName,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 24, 39, 92),
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Date: ${widget.date}",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 130, 130, 130),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                "${widget.from} from ${widget.to}",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 130, 130, 130),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: _form2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 24, 39, 92),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          errorStyle: TextStyle(
                            color: Colors.white,
                          ),
                          border: InputBorder.none,
                          hintText: "No of sheets",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Outfit-Regular",
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        keyboardType: TextInputType.number,
                        onSaved: (value) {
                          _enteredSheets = value!;
                        },
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              int.parse(value) > 5) {
                            return "Only 5 seats can be booked per NIC";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 24, 39, 92),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          errorStyle: TextStyle(
                            color: Colors.white,
                          ),
                          border: InputBorder.none,
                          hintText: "NIC",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Outfit-Regular",
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        onSaved: (value) {
                          _enteredNIC = value!;
                        },
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              value.trim().length != 10) {
                            return "Enter a valid NIC";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 24, 39, 92),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          errorStyle: TextStyle(
                            color: Colors.white,
                          ),
                          border: InputBorder.none,
                          hintText: "User Name",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Outfit-Regular",
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        onSaved: (value) {
                          _enteredUsername = value!;
                        },
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Enter a user name";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 24, 39, 92),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          errorStyle: TextStyle(
                            color: Colors.white,
                          ),
                          border: InputBorder.none,
                          hintText: "Description(Optional)",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Outfit-Regular",
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        onSaved: (value) {
                          _enteredDescription = value!;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 63, 63),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Text(
                    "Note: You can only book 5 seats per one NIC",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            if (!_isBooking)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ElevatedButton(
                  onPressed: _book,
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
                      "Book Seats",
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
            if (_isBooking)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ElevatedButton(
                  onPressed: _book,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: const EdgeInsets.all(17),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    backgroundColor: const Color.fromARGB(255, 24, 39, 92),
                  ),
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
