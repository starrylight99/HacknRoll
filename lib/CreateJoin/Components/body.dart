import 'package:flutter/material.dart';
import 'package:focusv2/Components/roundedButton.dart';
import 'package:focusv2/Components/squareInputField.dart';
import 'package:focusv2/Create/join.dart';
import 'package:focusv2/CreateJoin/Components/background.dart';
import 'package:focusv2/color.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String roomName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(
            'Pick your poison',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SquareInputField(
              hintText: 'Enter Room Name',
              onChanged: (value) {
                roomName = value;
              }),
          SizedBox(height: size.height * 0.1),
          RoundedButton(
            text: 'Create Room',
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Create(roomName)));
            },
            color: kPrimaryColor,
          ),
          SizedBox(height: size.height * 0.03),
          RoundedButton(
            text: 'Join Room',
            press: () {},
            color: kPrimaryLightcolor,
          )
        ]));
  }
}
