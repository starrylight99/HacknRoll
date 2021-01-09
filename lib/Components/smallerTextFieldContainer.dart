import 'package:flutter/material.dart';
import 'package:focusv2/color.dart';

class SmallerTextFieldContainer extends StatelessWidget {
  final Widget child;
  const SmallerTextFieldContainer({Key key, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.3,
        color: kPrimaryLightcolor,
        child: child);
  }
}
