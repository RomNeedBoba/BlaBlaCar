import 'package:flutter/material.dart';
import '../../model/ride/ride.dart';

class SeatScreen extends StatelessWidget {
  final Ride ride;
  final ValueChanged<int> onSeatSelected;

  const SeatScreen({super.key, required this.ride, required this.onSeatSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Seat')),
      body: ListView.builder(
        itemCount: ride.availableSeats,
        itemBuilder: (context, index) => ListTile(
          title: Text('Seat ${index + 1}'),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SeatSelectionPage(
                initialSeat: index + 1,
                onSeatSelected: onSeatSelected,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SeatSelectionPage extends StatefulWidget {
  final int initialSeat;
  final ValueChanged<int> onSeatSelected;

  const SeatSelectionPage({super.key, required this.initialSeat, required this.onSeatSelected});

  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  late int selectedSeat;

  @override
  void initState() {
    super.initState();
    selectedSeat = widget.initialSeat;
  }

  void _updateSeat(int change) {
    setState(() {
      selectedSeat = (selectedSeat + change).clamp(1, 100); // Prevents negative seats
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Number of Seats')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => _updateSeat(-1),
            ),
            Text('$selectedSeat', style: const TextStyle(fontSize: 24)),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _updateSeat(1),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.onSeatSelected(selectedSeat);
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
