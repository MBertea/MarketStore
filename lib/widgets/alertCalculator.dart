import 'package:flutter/material.dart';
import 'package:marketstoreapp/widgets/textWidget.dart';

class AlertCalculator extends StatelessWidget {
  final String _title;
  final String content;
  final double size;

  AlertCalculator(this._title, {this.content = '', this.size});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[800],
      title: TextWidget(
        this._title,
        italic: true,
        color: Colors.orange,
        fontSize: this.size,
      ),
      content: this.content == '' ? null : TextWidget(
        this.content,
        color: Colors.orange[400],
      ),
    );
  }
}
