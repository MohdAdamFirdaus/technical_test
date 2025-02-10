import 'package:flutter/material.dart';
import 'seat_selection_screen.dart';

class TrainSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> trains = [
    {'trainNumber': '101', 'name': 'Express 101', 'departure': '10:00 AM', 'arrival': '2:00 PM'},
    {'trainNumber': '202', 'name': 'Fast Rail 202', 'departure': '11:30 AM', 'arrival': '3:30 PM'},
    {'trainNumber': '303', 'name': 'Bullet Train 303', 'departure': '1:00 PM', 'arrival': '5:00 PM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select a Train'),backgroundColor:Colors.blue,),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: trains.length,
        itemBuilder: (context, index) {
          final train = trains[index];
          return Card(
            child: ListTile(
              title: Text(train['name']!),
              subtitle: Text("Train No: ${train['trainNumber']} | Departure: ${train['departure']} | Arrival: ${train['arrival']}"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatSelectionScreen(train: train),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
