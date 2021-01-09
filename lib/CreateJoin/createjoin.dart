import 'package:flutter/material.dart';
import 'package:focusv2/CreateJoin/Components/body.dart';

class CreateJoin extends StatelessWidget {
  final String name;

  CreateJoin(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Welcome ' + this.name)), body: Body());
  }
}
