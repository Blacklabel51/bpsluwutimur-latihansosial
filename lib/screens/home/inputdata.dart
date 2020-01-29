import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputData extends StatefulWidget {
  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  final _formKey = GlobalKey<FormState>();

  //form values

  String _currentName;
  String _currentjeniskelamin;
  String _currentjabatan;

  bool val = false;
  onSwitchValueChanged(bool newVal) {
    setState(() {
      val = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final user =Provider.of<Userprofile>(context);
    return new Material(
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              'Progres Kegiatan',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextField(
              decoration: new InputDecoration(
                  icon: Icon(Icons.dashboard),
                  hintText: "Kepala Rumah Tangga",
                  border: InputBorder.none),
            ),

            TextField(
              decoration: new InputDecoration(
                  icon: Icon(Icons.people),
                  hintText: "Jumlah ART",
                  border: InputBorder.none),
              keyboardType: TextInputType.numberWithOptions(),
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
            ),
            TextField(
              decoration: new InputDecoration(
                  icon: Icon(Icons.note),
                  hintText: "Catatan",
                  border: InputBorder.none),
            ),
            //Switch
            Row(
              children: <Widget>[
                new Expanded(
                                  child: Text(
                    'Status Pencacahan',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                            Switch(
                value: val,
                onChanged: (newVal) {
                  onSwitchValueChanged(newVal);
                }),
              ],
            ),

            //button
            RaisedButton(
              color: Colors.pink[400],
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                // print(_currentName);
                // print(_currentjeniskelamin);
                // print(_currentjabatan);

                if (_formKey.currentState.validate()) {
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
