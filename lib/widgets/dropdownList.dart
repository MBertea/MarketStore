import 'package:flutter/material.dart';
import 'package:marketstoreapp/widgets/textWidget.dart';

class DropDownList extends StatefulWidget {
  String _dropdownValue = 'Bronze';

  String get dropdownValue => _dropdownValue;

  set dropdownValue(String value) {
    _dropdownValue = value;
  }

  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
            color: Colors.grey[800],
        ),
        child: DropdownButton<String>(
          dropdownColor: Colors.grey[800],
          value: widget.dropdownValue,
          underline: Container(),
          icon: Icon(Icons.arrow_drop_down),
          iconEnabledColor: Colors.orange,
          onChanged: (String newValue) {
            setState(() {
              widget._dropdownValue = newValue;
            });
          },
          items: <String>['Bronze', 'Silver', 'Gold'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: TextWidget(value, color: Colors.orange,),
            );
          }).toList(),
        ),
      ),
    );
  }
}
