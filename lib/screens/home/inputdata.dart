import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sosial/services/database.dart';
import 'package:sosial/shared/constants.dart';
import 'package:sosial/models/user.dart';
import 'package:sosial/shared/loading.dart';

class InputData extends StatefulWidget {
  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  
  final _formKey = GlobalKey<FormState>();
  final List<String> jeniskelamin = ['Laki-laki', 'Perempuan'];
  final List<String> jabatan = ['Organik BPS', 'Mitra BPS'];

  //fomr values

  String _currentName;
  String _currentjeniskelamin;
  String _currentjabatan;

  bool val=false;
  onSwitchValueChanged(bool newVal){
    setState(() {
      val=newVal;
    });
  }

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
              Text('Ruta 1 KRT Sakernas', style: TextStyle(fontSize: 18.0),),
              SizedBox(height: 20.0,),
              
              //Switch
              Text('Progres Kegiatan', style: TextStyle(fontSize: 18.0),),
              Switch(value: val,onChanged: (newVal){
                onSwitchValueChanged(newVal);
              }),


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