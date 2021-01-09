import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            child,
            Positioned(
                bottom: 0,
                right: 0,
                child: Image(
                    height: size.height * 0.1,
                    width: size.width * 0.1,
                    image: AssetImage('assets/images/blue1.jpeg')))
          ],
        ));
  }
}
