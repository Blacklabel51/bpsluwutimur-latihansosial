import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sosial/models/user.dart';
import 'package:sosial/authenticate/authenticate.dart';
import 'package:sosial/screens/home/home.dart';
//import 'package:sosial/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return home atau authenicate widget

final user =Provider.of<Userprofile>(context);
print(user);
if(user==null){
    return  Authenticate();
    }else{
      return Home();
    }
  }
}