import 'package:flutter/material.dart';
import '../../model/ride/locations.dart';

class LocationPicker extends StatefulWidget {
  final List<Location> locations;
  final Function(Location) onLocationSelected;

  const LocationPicker({
    required this.locations,
    required this.onLocationSelected,
    Key? key,
  }) : super(key: key);

  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  final TextEditingController _controller = TextEditingController();
  List<Location> _filteredLocations = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(_filterLocations);
    _filteredLocations = widget.locations;
  }

  void _filterLocations() {
    setState(() {
      _filteredLocations = widget.locations
          .where((location) => location.name
              .toLowerCase()
              .contains(_controller.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Search City',
              prefixIcon: Icon(Icons.search),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _controller.clear(),
                    )
                  : null,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredLocations.length,
              itemBuilder: (context, index) {
                final location = _filteredLocations[index];
                return ListTile(
                  title: Text(location.name),
                  onTap: () => widget.onLocationSelected(location),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
