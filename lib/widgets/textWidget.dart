import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String _title;
  final bool italic;
  final double fontSize;
  final Color color;

  TextWidget(this._title, {this.italic = false, this.fontSize, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(
          color: color,
          fontStyle: italic ? FontStyle.italic : null,
          fontSize: fontSize
      ),

    );
  }
}
