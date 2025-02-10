import 'package:flutter/material.dart';
import 'booking_confirmation_screen.dart';

class SeatSelectionScreen extends StatefulWidget {
  final Map<String, String> train;
  SeatSelectionScreen({required this.train});

  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  List<List<String>> coaches = List.generate(6, 
    (coach) => List.generate(20, (seat) => "C${coach + 1} S${seat + 1}"));

  Set<String> lockedSeats = {}; // Store locked seats
  String? selectedSeat;
  int selectedCoach = 0;

  void selectSeat(int coachIndex, int seatIndex) {
    String seat = coaches[coachIndex][seatIndex];

    // Prevent selecting locked seats
    if (lockedSeats.contains(seat)) return;

    setState(() {
      selectedSeat = seat;
      selectedCoach = coachIndex;
    });
  }

 void confirmBooking() {
  if (selectedSeat != null) {
    setState(() {
      lockedSeats.add(selectedSeat!); // Lock the seat
    });

    String seatToBook = selectedSeat!; // Store seat before resetting
    selectedSeat = null; // Reset selection

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingConfirmationScreen(
          train: widget.train,
          seat: seatToBook, // Pass the stored seat
        ),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Seats (${widget.train['name']})"),backgroundColor: Colors.blue,),
      body: Column(
        children: [
          DropdownButton<int>(
            value: selectedCoach,
            items: List.generate(6, (i) => DropdownMenuItem(value: i, child: Text("Coach ${i + 1}"))),
            onChanged: (i) => setState(() => selectedCoach = i!),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.5,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                String seat = coaches[selectedCoach][index];

                return GestureDetector(
                  onTap: () => selectSeat(selectedCoach, index),
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: lockedSeats.contains(seat)
                          ? Colors.red // Locked seat
                          : (seat == selectedSeat ? Colors.green : Colors.grey[300]), // Selected or available
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(child: Text(seat, style: TextStyle(color: Colors.white))),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: selectedSeat != null ? confirmBooking : null,
            child: Text("Confirm Booking"),
          ),
        ],
      ),
    );
  }
}
