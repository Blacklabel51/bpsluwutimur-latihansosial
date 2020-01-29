

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sosial/models/user.dart';
import 'package:sosial/screens/home/inputdata.dart';
import 'package:sosial/screens/home/settings.dart';
import 'package:sosial/services/auth.dart';
import 'package:sosial/services/database.dart';
import 'package:sosial/shared/loading.dart';
import 'package:sosial/shared/constants.dart';

class MyTask extends StatefulWidget {



  @override
  _MyTaskState createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {

  final AuthService _auth =AuthService();

  final _formKey = GlobalKey<FormState>();
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
    void _signOut(){
      AlertDialog alertDialog = new AlertDialog(
        content: Container(
          height: 250.0,
          child: new Column(
            children: <Widget>[
              ClipOval(
                child: new Image.network('https://yt3.ggpht.com/a-/AAuE7mDRuu2V-LzGRnOMRd1ZQa3Ovm0MIwDmONJhQ0juaw=s88-c-k-c0xffffffff-no-rj-mo'),
              ),
              new Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Sign Out??",style:new TextStyle(fontSize: 16.0)),
              ),
              new Divider(),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell (
                    onTap: (){_auth.signout();},
                  child: Column(
                  children: <Widget>[
                    Icon(Icons.check),
                  Padding(padding: const EdgeInsets.all(5.0),),
                  Text("Yes")
                  ]
                  
                ),),
                  InkWell (
                    onTap: (){
                      Navigator.pop(context);},
                  child: Column(
                  children: <Widget>[
                    Icon(Icons.close),
                  Padding(padding: const EdgeInsets.all(5.0),),
                  Text("Cancel")
                  ]
                  
                ),),                
                ],

                
              ),
            ],
          ),
        ),
      );

      showDialog(context: context,child: alertDialog);
    }
    void _inputdata(){
      AlertDialog alertDialog = new AlertDialog(
        content: Container(
          height: 350.0,
          child: InputData(),
        ),
      );

      showDialog(context: context,child: alertDialog);
    
    }
    final user =Provider.of<Userprofile>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserData userData = snapshot.data;
          
          
//           Form(
//           key: _formKey,
//           child: Column(
//             children: <Widget>[
//               Text(userData.name, style: TextStyle(fontSize: 38.0),),
//               // SizedBox(height: 20.0,),
//               Text(userData.jeniskelamin, style: TextStyle(fontSize: 38.0),),
// ],
//           ),
//         );
        return Scaffold(
          floatingActionButton: new FloatingActionButton(
            onPressed: (){
              _inputdata();
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.purple,
          ),
          body: Container(
            height: 170.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.purple,
              boxShadow: [
                new BoxShadow(
                  color: Colors.blueGrey,
                  blurRadius: 8.0,
                )  
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: <Widget>[
                      new InkWell(onTap: (){
                        _showSettingsPanel();
                      },
                                              child: Container(
                          width: 60.0, height: 60.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            
                            image: DecorationImage(
                              image: new NetworkImage('https://yt3.ggpht.com/a-/AAuE7mDRuu2V-LzGRnOMRd1ZQa3Ovm0MIwDmONJhQ0juaw=s88-c-k-c0xffffffff-no-rj-mo'), fit : BoxFit.cover,
                              
                            )
                          ),
                        ),
                      ),
                      new Expanded(
                                          child: new Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text("Selamat Datang", style:new TextStyle(fontSize:18.0,color:Colors.white),),
                              new Text(userData.name, style:new TextStyle(fontSize:18.0,color:Colors.white),),
                            ],
                          ),
                        ),
                      ),
                      new IconButton(
                        icon: Icon(Icons.exit_to_app,color:Colors.white, size:30.0),
                        onPressed: (){
                 _signOut();
              },
                      )
                    ],
                  ),
                ),
                new Text("My Task", style: new TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  letterSpacing: 2.0,
                ),)
              ],
            ),
            
          ),
        );
        }else{
          return Loading();
        }
        }
    );
  }
  }