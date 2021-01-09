import 'package:flutter/material.dart';
import 'package:focusv2/color.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.4,
        decoration: BoxDecoration(
            color: kPrimaryLightcolor, borderRadius: BorderRadius.circular(29)),
        child: child);
  }
}
