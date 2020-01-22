import 'package:flutter/material.dart';
import 'package:sosial/screens/services/auth.dart';

class Home extends StatelessWidget {

  final AuthService _auth =AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sosial'),
        backgroundColor: Colors.blue,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: ()async{
              await _auth.signout();
            },
          )
        ],
      ),
    );
  }
}