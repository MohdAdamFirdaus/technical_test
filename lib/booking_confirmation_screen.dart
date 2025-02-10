import 'package:flutter/material.dart';
import 'payment_screen.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final Map<String, String> train;
  final String seat;

  BookingConfirmationScreen({required this.train, required this.seat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking Confirmation"),backgroundColor: Colors.blue,),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Train: ${train['name']}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Train No: ${train['trainNumber']}", style: TextStyle(fontSize: 16)),
            Text("Departure: ${train['departure']}", style: TextStyle(fontSize: 16)),
            Text("Arrival: ${train['arrival']}", style: TextStyle(fontSize: 16)),
            Text("Seat: $seat", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
            SizedBox(height: 30),
            
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Payment Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(
                        train: train,
                        seat: seat,
                        price: 50.0, // Example price
                      ),
                    ),
                  );
                },
                child: Text("Proceed to Payment"),
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
              ),
            ),

            SizedBox(height: 20),

            Center(
              child: TextButton(
                onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
                child: Text("Cancel Booking"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
