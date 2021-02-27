import 'package:flutter/material.dart';
import 'package:marketstoreapp/widgets/textWidget.dart';

class MockResult extends StatelessWidget {
  final String _title;
  final String _content;

  MockResult(this._title, this._content);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          this._title,
          italic: true,
          fontSize: 20,
          color: Colors.grey[400],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TextWidget(
            this._content,
            color: Colors.orange[400],
          ),
        ),
      ],
    );
  }
}
