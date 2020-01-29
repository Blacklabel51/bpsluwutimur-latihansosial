import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sosial/models/usersosial.dart';
import 'package:sosial/screens/home/User_tile.dart';

class Userlist extends StatefulWidget {
  @override
  _UserlistState createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  @override
  Widget build(BuildContext context) {

    final sosial =Provider.of<List<User>>(context) ?? [];
    //print(sosial.documents);

    // sosial.forEach((sosial){
    //   print(sosial.name);
    //   print(sosial.jabatan);
    //   print(sosial.jeniskelamin);
    // });



    return ListView.builder(
      itemCount: sosial.length,
      itemBuilder: (context,index){
        return UserTile(sosial: sosial[index]);
      },
    );
  }
}