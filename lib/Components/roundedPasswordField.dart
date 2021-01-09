import 'package:flutter/material.dart';
import 'package:focusv2/Components/textFieldContainer.dart';
import 'package:focusv2/color.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    this.onChanged,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(Icons.lock, color: kPrimaryColor),
            suffixIcon: Icon(Icons.visibility, color: kPrimaryColor),
            border: InputBorder.none),
      ),
    );
  }
}
