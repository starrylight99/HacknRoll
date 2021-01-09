import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focusv2/Components/roundedButton.dart';
import 'package:focusv2/Login/login.dart';
import 'package:focusv2/Welcome/components/background.dart';
import 'package:focusv2/color.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // max size is 55 for some unknown reason
            Image(image: AssetImage('assets/images/55.png')),
            SizedBox(height: size.height * 0.1),
            Text('Please enter to start recording.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: size.height * 0.1),
            RoundedButton(
                text: 'Enter',
                color: kPrimaryColor,
                textColor: Colors.black,
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                }),
            // RoundedButton(
            //     text: 'Login',
            //     color: kPrimaryLightcolor,
            //     textColor: Colors.black,
            //     press: () {})
          ]),
    );
  }
}
