import 'package:flutter/material.dart';
import 'package:sosial/screens/home/mytask.dart';
import 'package:sosial/screens/home/settings.dart';
import 'package:sosial/services/auth.dart';
import 'package:sosial/services/database.dart';
import 'package:provider/provider.dart';
import 'package:sosial/screens/home/userlist.dart';
import 'package:sosial/models/usersosial.dart';

class Home extends StatelessWidget {

  final AuthService _auth =AuthService();
  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context,builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingForm(),
          );
      });
    }
    return StreamProvider<List<User>>.value(
        value: DatabaseService().sosial,
        child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   title: Text('Sosial'),
        //   backgroundColor: Colors.blue,
        //   elevation: 0.0,
        //   actions: <Widget>[
        //     // FlatButton.icon(
        //     //   icon: Icon(Icons.person),
        //     //   label: Text('logout'),
        //     //   onPressed: ()async{
        //     //     await _auth.signout();
        //     //   },
        //     // ),
        //     FlatButton.icon(
        //       icon: Icon(Icons.settings),
        //       label: Text('settings'),
        //       onPressed: ()=>_showSettingsPanel(),
        //     )
        //   ],
        // ),
        body: MyTask(),
      ),
    );
  }
}