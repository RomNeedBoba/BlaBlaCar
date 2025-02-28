import 'package:flutter/material.dart';

class SeatSelectionScreen extends StatefulWidget {
  final int initialSeats;

  const SeatSelectionScreen({super.key, required this.initialSeats});

  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  late int selectedSeats;

  @override
  void initState() {
    super.initState();
    selectedSeats = widget.initialSeats;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Seats'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('How many seats do you need?', style: TextStyle(fontSize: 28)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove, size: 36),
                  onPressed: () {
                    setState(() {
                      if (selectedSeats > 1) selectedSeats--;
                    });
                  },
                ),
                Text('$selectedSeats', style: TextStyle(fontSize: 48)),
                IconButton(
                  icon: Icon(Icons.add, size: 36),
                  onPressed: () {
                    setState(() {
                      selectedSeats++;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(selectedSeats);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
