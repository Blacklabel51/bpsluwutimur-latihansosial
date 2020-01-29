import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sosial/models/user.dart';
import 'package:sosial/services/database.dart';
import 'package:sosial/shared/loading.dart';
import 'package:sosial/shared/constants.dart';

class MyTask extends StatefulWidget {


  @override
  _MyTaskState createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {

  final _formKey = GlobalKey<FormState>();
  final List<String> jeniskelamin = ['Laki-laki', 'Perempuan'];
  final List<String> jabatan = ['Organik BPS', 'Mitra BPS'];

  //fomr values

  String _currentName;
  String _currentjeniskelamin;
  String _currentjabatan;

  @override
  Widget build(BuildContext context) {
    final user =Provider.of<Userprofile>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserData userData = snapshot.data;
          return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text('Update Profile.', style: TextStyle(fontSize: 18.0),),
              SizedBox(height: 20.0,),
              TextFormField(
                initialValue: userData.name,
                decoration: textInputDecoration,
                validator: (val)=> val.isEmpty? 'Please enter a name' : null,
                onChanged: (val) =>setState(()=>_currentName=val),
              ),
              SizedBox(height: 20.0,),
              //dropdown
              DropdownButtonFormField(
                hint: new Text("Buscar..",
                                  textAlign: TextAlign.center),
                value: _currentjeniskelamin ?? userData.jeniskelamin,
                items: jeniskelamin.map((jk){
                  return DropdownMenuItem(
                    value : jk,
                    child:Text('$jk'),
                  );
                }).toList(),
                    onChanged: (val) =>setState(()=>_currentjeniskelamin=val),
              ),
              //slider
              DropdownButtonFormField(
                hint: new Text("Buscar..",
                                  textAlign: TextAlign.center),
                value: _currentjabatan ?? userData.jabatan,
                items: jabatan.map((jbtn){
                  return DropdownMenuItem(
                    value : jbtn,
                    child:Text('$jbtn'),
                  );
                }).toList(),
                    onChanged: (val) =>setState(()=>_currentjabatan=val),
              ),
              //button
              RaisedButton(
                color: Colors.pink[400],
                child: Text('Update',style: TextStyle(color: Colors.white),),
                onPressed: () async{
                  // print(_currentName);
                  // print(_currentjeniskelamin);
                  // print(_currentjabatan);

                  if(_formKey.currentState.validate()){
                    await DatabaseService(uid: user.uid).updateUserData(
                      _currentName ?? userData.name,
                       _currentjeniskelamin ?? userData.jeniskelamin,
                      _currentjabatan ?? userData.jabatan,
                      
                     
                    );
                    Navigator.pop(context);
                  }

                } ,)
            ],
          ),
        );
      
        }else{
          return Loading();
        }
        }
    );
  }
}