import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:focusv2/Components/account.dart';
import 'package:focusv2/Components/alreadyHaveAnAccount.dart';
import 'package:focusv2/Components/api.dart';
import 'package:focusv2/Components/roundedButton.dart';
import 'package:focusv2/Components/roundedInputField.dart';
import 'package:focusv2/Components/roundedPasswordField.dart';
import 'package:focusv2/Signup/Components/background.dart';
import 'package:focusv2/color.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String url;
  String userId;
  String passWord;
  Account details = new Account('.', '.');
  bool idClash = false;
  var data;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text(
            "Sign Up",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03),
          RoundedInputField(
            hintText: "Your Email",
            onChanged: (value) {
              userId = value;
            },
          ),
          RoundedPasswordField(
            onChanged: (value) {
              passWord = value;
            },
          ),
          RoundedButton(
              text: "Sign Up",
              press: () async {
                details.user = userId;
                details.password = passWord;
                url = 'http://127.0.0.1:5000/create?Query=' +
                    this.userId.toString() +
                    ' ' +
                    this.passWord.toString();
                data = await getdata(url);
                var idclash = jsonDecode(data);
                if (idclash['Query']) {
                  print('1');
                  Navigator.pop(context);
                } else {
                  print('2');
                  setState(() {
                    idClash = true;
                  });
                }
              },
              color: idClash ? Colors.red : kPrimaryColor),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pop(context);
              })
        ]));
  }
}
