import 'package:bus_app/screens/bus_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  final _form = GlobalKey<FormState>();
  DateTime? _selectedDate;
  String formattedDate = "";
  String _enteredFrom = "";
  String _enteredTo = "";

  void _presentDatePicker() async {
    FocusScope.of(context).unfocus();
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: DateTime(2025));

    setState(() {
      _selectedDate = pickedDate;
    });
    formattedDate = formatter.format(_selectedDate!);
  }

  void _submit() {
    var isValide = _form.currentState!.validate();

    if (!isValide) {
      return;
    }
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please set the date"),
        ),
      );
      return;
    }

    FocusScope.of(context).unfocus();
    _form.currentState!.save();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => BusListScreen(
          userFrom: _enteredFrom,
          userTo: _enteredTo,
          date: formattedDate,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Enter Travel Details',
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
              Image.asset(
                "assets/icon_foreground.png",
                width: 150,
              ),
              Form(
                key: _form,
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
                            Radius.circular(20),
                          ),
                        ),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            errorStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                            hintText: "From",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Outfit-Regular",
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          onSaved: (value) {
                            _enteredFrom = value!;
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Enter a valid place";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 24, 39, 92),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            errorStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                            hintText: "To",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Outfit-Regular",
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          onSaved: (value) {
                            _enteredTo = value!;
                          },
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Enter a valid place";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: ElevatedButton(
                            onPressed: _presentDatePicker,
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: const EdgeInsets.all(17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 24, 39, 92),
                            ),
                            child: SizedBox(
                              width: 150,
                              child: Center(
                                child: Text(
                                  _selectedDate == null
                                      ? "Selecte a Date"
                                      : formatter.format(_selectedDate!),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Opacity(
                opacity: 0.5,
                child: Image.asset("assets/placeholder.png"),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: ElevatedButton(
                  onPressed: _submit,
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
                      "Get available buses",
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
        ),
      ),
    );
  }
}
