import 'package:flutter/material.dart';
import 'train_selection_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? origin;
  String? destination;
  DateTime selectedDate = DateTime.now();

  void selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Train Ticket Booking'),
      backgroundColor:Colors.blue ,),
 
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Origin"),
              items: ['Kuala Lumpur', 'Johor Bahru', 'Negeri Sembilan']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => origin = val),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Destination"),
              items: ['Johor Bahru', 'Kedah', 'Selangor']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) => setState(() => destination = val),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("Date: ${selectedDate.toLocal()}".split(' ')[0]),
              trailing: Icon(Icons.calendar_today_rounded),
              onTap: () => selectDate(context),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (origin != null && destination != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrainSelectionScreen()),
                  );
                }
              },
              child: Text("Search Trains"),
            ),
          ],
        ),
      ),
    );
  }
}
