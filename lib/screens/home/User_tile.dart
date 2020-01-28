import 'package:flutter/material.dart';
import 'package:sosial/models/usersosial.dart';

class UserTile extends StatelessWidget {

  final User sosial;
  UserTile({this.sosial});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blueAccent,

          ),
          title: Text(sosial.name),
          subtitle: Text(sosial.jabatan),
        ),
      ),
    );
  }
}