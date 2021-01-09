import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LinearSwitch extends StatelessWidget {
  Function notifyParent;
  bool value;
  ValueChanged<bool> onChanged;
  LinearSwitch({this.notifyParent, this.onChanged, this.value = false});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.1,
      height: size.height * 0.1,
      child: Switch(
        onChanged: onChanged,
        value: value,
        activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,
      ),
    );
  }
}
/*
class LinearSwitch extends StatelessWidget {
  final Function notifyParent;
  final bool value;
  final ValueChanged<bool> onChanged;
  const LinearSwitch(
      {this.notifyParent, this.onChanged, this.value = false, Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.1,
      height: size.height * 0.1,
      child: Switch(
        onChanged: onChanged,
        value: value,
        activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,
      ),
    );
  }
}
class LinearSwitch extends StatefulWidget {
  @override
  _LinearSwitchState createState() => _LinearSwitchState();
}

class _LinearSwitchState extends State<LinearSwitch> {
  Function notfiyParent;
  bool value;
  ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.1,
      height: size.height * 0.1,
      child: Switch(
        onChanged: onChanged,
        value: value,
        activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,
      ),
    );
  }
}

class LinearSwitch extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<LinearSwitch> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.1,
      height: size.height * 0.1,
      child: Switch(
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
          });
        },
        activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,
      ),
    );
  }
}
*/
