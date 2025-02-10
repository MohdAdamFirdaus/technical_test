import 'package:flutter/material.dart';
import 'package:technical_test/homescreen.dart';


void main() {
  runApp(TrainBookingApp());
}

class TrainBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Train Ticket Booking',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
