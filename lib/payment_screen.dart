import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final Map<String, String> train;
  final String seat;
  final double price;

  PaymentScreen({required this.train, required this.seat, required this.price});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentMethod = "Credit Card";

  void confirmPayment() {
    // Simulate payment process
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Payment Successful!"),
        content: Text("Your seat ${widget.seat} is booked."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to home
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payment"),backgroundColor: Colors.blue,),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Train: ${widget.train['name']}", style: TextStyle(fontSize: 18)),
            Text("Departure: ${widget.train['departure']}", style: TextStyle(fontSize: 16)),
            Text("Arrival: ${widget.train['arrival']}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Seat: ${widget.seat}", style: TextStyle(fontSize: 16)),
            Text("Total: \MYR${widget.price.toStringAsFixed(2)}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            
            Text("Select Payment Method", style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: selectedPaymentMethod,
              items: ["Credit Card", "PayPal", "Google Pay", "Apple Pay"].map((method) {
                return DropdownMenuItem(value: method, child: Text(method));
              }).toList(),
              onChanged: (value) => setState(() => selectedPaymentMethod = value!),
            ),
            
            Spacer(),
            ElevatedButton(
              onPressed: confirmPayment,
              child: Text("Confirm Payment"),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
    );
  }
}
