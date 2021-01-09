import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:focusv2/Components/account.dart';
import 'package:focusv2/Components/alreadyHaveAnAccount.dart';
import 'package:focusv2/Components/api.dart';
import 'package:focusv2/Components/roundedButton.dart';
import 'package:focusv2/Components/roundedInputField.dart';
import 'package:focusv2/Components/roundedPasswordField.dart';
import 'package:focusv2/CreateJoin/createjoin.dart';
import 'package:focusv2/Login/Components/background.dart';
import 'package:focusv2/Signup/signUp.dart';
import 'package:focusv2/color.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String url;
  var data;
  String userId;
  String passWord;
  Account details = new Account('.', '.');
  bool fresh = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
          RoundedInputField(
            hintText: 'Username',
            onChanged: (value) {
              userId = value;
            },
          ),
          RoundedPasswordField(onChanged: (value) {
            passWord = value;
          }),
          RoundedButton(
              text: 'Login',
              press: () async {
                details.user = userId;
                details.password = passWord;
                url = 'http://127.0.0.1:5000/api?Query=' +
                    this.userId.toString() +
                    ' ' +
                    this.passWord.toString();
                data = await getdata(url);
                var authenticated = jsonDecode(data);
                print(authenticated);
                if (authenticated['Query']) {
                  setState(() {
                    fresh = true;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateJoin(details.user)));
                  });
                } else {
                  setState(() {
                    fresh = false;
                  });
                }
              },
              color: fresh ? kPrimaryColor : Colors.red),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ]));
  }
}
