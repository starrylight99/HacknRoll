import 'package:flutter/material.dart';
import 'package:focusv2/Components/textFieldContainer.dart';
import 'package:focusv2/color.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField(
      {this.hintText,
      this.icon = Icons.person,
      color = kPrimaryColor,
      this.onChanged,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText, icon: Icon(icon), border: InputBorder.none),
      ),
    );
  }
}
