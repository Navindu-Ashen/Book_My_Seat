import 'package:bus_app/data/buses.dart';
import 'package:bus_app/models/bus.dart';
import 'package:bus_app/screens/booking.dart';
import 'package:bus_app/widgets/bus_card.dart';
import 'package:flutter/material.dart';
import 'dart:math';

final randomizor1 = Random();

class BusListScreen extends StatefulWidget {
  const BusListScreen({
    super.key,
    required this.userFrom,
    required this.userTo,
    required this.date,
  });

  final String userFrom;
  final String userTo;
  final String date;

  @override
  State<BusListScreen> createState() => _BusListScreenState();
}

class _BusListScreenState extends State<BusListScreen> {
  final List<Bus> shuffledList = getShuffledList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Available Buses"),
        backgroundColor: const Color.fromARGB(255, 207, 255, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 207, 255, 255),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: randomizor1.nextInt(5) + 1,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => BookingScreen(
                          date: widget.date,
                          from: widget.userFrom,
                          to: widget.userTo,
                          busName: shuffledList[index].name,
                        ),
                      ),
                    );
                  },
                  child: BusCard(
                    busDetails: shuffledList[index],
                    from: widget.userFrom,
                    to: widget.userTo,
                    date: widget.date,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
