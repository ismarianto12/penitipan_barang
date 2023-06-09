import 'package:flutter/material.dart';

class ComboBox extends StatefulWidget {
  final List<String> items;
  final String placeholder;
  final TextEditingController controllername;

  const ComboBox({this.items, this.placeholder, this.controllername});
  @override
  _ComboBoxState createState() => _ComboBoxState();
}

class _ComboBoxState extends State<ComboBox> {
  String _selectedItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.white),
      ),
      child: DropdownButtonFormField(
        hint: Text(widget.placeholder),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 7),
          enabledBorder: OutlineInputBorder(
            //<-- SEE HERE
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        dropdownColor: Colors.white,
        value: _selectedItem,
        onChanged: (String newValue) {
          setState(() {
            _selectedItem = newValue;
          });
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(fontSize: 20),
            ),
          );
        }).toList(),
      ),
    );
  }
}
