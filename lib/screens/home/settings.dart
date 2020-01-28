import 'package:flutter/material.dart';
import 'package:sosial/shared/constants.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  
  final _formKey = GlobalKey<FormState>();
  final List<String> jeniskelamin = ['Laki-laki', 'Perempuan'];
  final List<String> jabatan = ['Organik BPS', 'Mitra BPS'];

  //fomr values

  String _currentName;
  String _currentjeniskelamin;
  String _currentjabatan;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text('Update Profile.', style: TextStyle(fontSize: 18.0),),
          SizedBox(height: 20.0,),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val)=> val.isEmpty? 'Please enter a name' : null,
            onChanged: (val) =>setState(()=>_currentName=val),
          ),
          SizedBox(height: 20.0,),
          //dropdown
          DropdownButtonFormField(
            hint: new Text("Buscar..",
                              textAlign: TextAlign.center),
            value: _currentjeniskelamin ?? 'Laki-laki',
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
            value: _currentjabatan ?? 'Organik BPS',
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
              print(_currentName);
              print(_currentjeniskelamin);
              print(_currentjabatan);
            } ,)
        ],
      ),
    );
  }
}