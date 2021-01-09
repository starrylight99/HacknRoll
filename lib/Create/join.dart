import 'package:flutter/material.dart';
import 'package:focusv2/Create/Components/body.dart';

class Create extends StatelessWidget {
  final String roomname;

  Create(this.roomname);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Room ' + this.roomname)),
      body: Body(this.roomname),
    );
  }
}
