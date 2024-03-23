import 'package:bus_app/models/bus.dart';
import 'package:flutter/material.dart';

class BusCard extends StatelessWidget {
  const BusCard({
    super.key,
    required this.busDetails,
    required this.from,
    required this.to,
    required this.date,
  });

  final Bus busDetails;
  final String from;
  final String to;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100.0, 10.0, 20.0, 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        busDetails.name,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Outfit-Regular",
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 24, 39, 92),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 3,
                      ),
                      const Icon(
                        Icons.access_time_rounded,
                        size: 16.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        from,
                        style: const TextStyle(
                          fontSize: 12.4,
                          fontFamily: "Outfit-Regular",
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 24, 39, 92),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 3,
                      ),
                      const Icon(
                        Icons.access_time_rounded,
                        size: 16.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        to,
                        style: const TextStyle(
                          fontSize: 12.4,
                          fontFamily: "Outfit-Regular",
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Date selected: $date",
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: "Outfit-Regular",
                    color: Color.fromARGB(255, 134, 134, 134),
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
        Positioned(
          left: 15,
          top: 15,
          bottom: 15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              width: 110.0,
              image: AssetImage(busDetails.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
