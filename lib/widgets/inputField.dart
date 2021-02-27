import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final TextEditingController _filter = new TextEditingController();
  final bool hide;
  final double width;
  InputField(this.title, {this.hide = false, this.width = 250.0});

  double getValue() {
    try{
      return _filter.text.isEmpty ? null : double.parse(_filter.text);
    } catch(e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.width,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(45)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
              keyboardType: TextInputType.number,
              obscureText: hide,
              controller: _filter,
              style: TextStyle(color: Colors.grey[200]),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: title
              ),
            ),
          ),
        );
  }
}
