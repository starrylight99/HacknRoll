import 'package:flutter/material.dart';
import 'package:focusv2/Components/smallerTextFieldContainer.dart';

class SquareInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  const SquareInputField({Key key, this.onChanged, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmallerTextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration:
            InputDecoration(hintText: hintText, border: InputBorder.none),
      ),
    );
  }
}
