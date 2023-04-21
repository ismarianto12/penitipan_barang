import 'package:flutter/material.dart';

class ComboBox extends StatefulWidget {
  @override
  _ComboBoxState createState() => _ComboBoxState();
}

class _ComboBoxState extends State<ComboBox> {
  String _selectedItem;

  final List<String> _items = [
    'Satuan',
    'Lusin',
    'Bendle',
    'Pcs',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButton<String>(
        value: _selectedItem,
        items: _items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String selectedItem) {
          setState(() {
            _selectedItem = selectedItem;
          });
        },
        icon: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_drop_down),
          ],
        ),
        iconSize: 24.0,
        elevation: 16,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        underline: Container(
          height: 2,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
