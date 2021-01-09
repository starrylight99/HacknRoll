import 'dart:async';
import 'package:flutter/material.dart';
import 'package:focusv2/Components/fetchList.dart';
import 'package:focusv2/Components/linearSwitch.dart';
import 'package:focusv2/Components/participant.dart';
import 'package:focusv2/Components/participantList.dart';
import 'package:focusv2/Create/Components/background.dart';

class Body extends StatefulWidget {
  final String roomname;

  Body(this.roomname);

  @override
  _BodyState createState() => _BodyState(this.roomname);
}

class _BodyState extends State<Body> {
  Future<List> futureParticipants;
  String roomname;
  String url;
  var data;
  List<Participant> participants = [];
  bool switched = false;
  bool turnOn;
  Timer timer;

  _BodyState(this.roomname);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(children: <Widget>[
      Expanded(
          child: FutureBuilder<List>(
              future: futureParticipants,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (participants.isEmpty) {}
                  List temp = snapshot.data;
                  for (List i in temp) {
                    participants.add(Participant(i[0], i[1], i[2], i[3]));
                  }
                  return ParticipantList(this.participants);
                } else {
                  return ParticipantList(this.participants);
                }
              })),
      new LinearSwitch(
          onChanged: (press) {
            setState(() {
              switched = press;
              turnOn = press;
            });
          },
          notifyParent: refresh(),
          value: switched)
    ]));
  }

  @override
  void initState() {
    super.initState();
    print(turnOn);
    if (turnOn != null || turnOn == true) {
      timer =
          Timer.periodic(Duration(seconds: 10), (Timer t) => this.refresh());
    }
  }

  refresh() {
    participants.clear();
    url = 'http://qwerty73098.pythonanywhere.com/api?Query=' + this.roomname;
    futureParticipants = fetchList(url);
    super.setState(() {});
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
