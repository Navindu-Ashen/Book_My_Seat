import 'package:bus_app/models/bus.dart';

final List<Bus> buses = [
  Bus(
    name: "ND-3567",
    description: "Testing 123",
    imagePath: "assets/bus1.jpg",
  ),
  Bus(
    name: "NC-2567",
    description: "Testing 123",
    imagePath: "assets/bus2.jpg",
  ),
  Bus(
    name: "NP-9405",
    description: "Testing 123",
    imagePath: "assets/bus3.JPG",
  ),
  Bus(
    name: "NV-1436",
    description: "Testing 123",
    imagePath: "assets/bus4.jpg",
  ),
  Bus(
    name: "NA-5940",
    description: "Testing 123",
    imagePath: "assets/bus5.jpg",
  ),
  Bus(
    name: "NS-5489",
    description: "Testing 123",
    imagePath: "assets/bus6.jpg",
  ),
  Bus(
    name: "NY-1234",
    description: "Testing 123",
    imagePath: "assets/bus7.jpg",
  ),
  Bus(
    name: "NF-8504",
    description: "Testing 123",
    imagePath: "assets/placeholder2.png",
  ),
  Bus(
    name: "NE-3654",
    description: "Testing 123",
    imagePath: "assets/placeholder2.png",
  ),
  Bus(
    name: "NX-1948",
    description: "Testing 123",
    imagePath: "assets/placeholder2.png",
  ),
];

List<Bus> getShuffledList() {
    final shuffledList = List.of(buses);
    shuffledList.shuffle();
    return shuffledList;
  }