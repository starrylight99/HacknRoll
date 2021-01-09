import 'package:flutter/material.dart';
import 'package:focusv2/Components/participant.dart';

class ParticipantList extends StatefulWidget {
  final List<Participant> listParticipants;

  ParticipantList(this.listParticipants);

  @override
  _ParticipantListState createState() => _ParticipantListState();
}

class _ParticipantListState extends State<ParticipantList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.widget.listParticipants.length,
        itemBuilder: (context, index) {
          var participant = this.widget.listParticipants[index];
          return Card(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ListTile(
                      title: Text(participant.studentId),
                      subtitle: Text(participant.afkTime.toString())),
                ),
                Row(
                  children: <Widget>[
                    Text(participant.status, style: TextStyle(fontSize: 20)),
                    Icon(
                      Icons.lightbulb,
                      color: Colors.green,
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
