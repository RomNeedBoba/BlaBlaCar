import 'package:flutter/material.dart';
import '../../model/ride/locations.dart';

class LocationPicker extends StatefulWidget {
  final List<Location> locations;
  final Function(Location) onLocationSelected;

  const LocationPicker({
    Key? key,
    required this.locations,
    required this.onLocationSelected,
  }) : super(key: key);

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  late final TextEditingController _controller;
  late List<Location> _filteredLocations;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _filteredLocations = widget.locations;
    _controller.addListener(_filterLocations);
  }

  void _filterLocations() {
    final query = _controller.text.toLowerCase();
    setState(() {
      _filteredLocations = widget.locations
          .where((location) => location.name.toLowerCase().startsWith(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSearchField(),
        Expanded(child: _buildLocationList()),
      ],
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Search City',
        prefixIcon: Icon(Icons.search),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.clear),
                onPressed: _controller.clear,
              )
            : null,
      ),
    );
  }

  Widget _buildLocationList() {
    return ListView.builder(
      itemCount: _filteredLocations.length,
      itemBuilder: (context, index) {
        final location = _filteredLocations[index];
        return ListTile(
          title: Text(location.name),
          onTap: () => widget.onLocationSelected(location),
        );
      },
    );
  }
}
