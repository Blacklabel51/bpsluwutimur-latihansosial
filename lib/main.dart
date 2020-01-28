import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sosial/models/user.dart';
import 'package:sosial/services/auth.dart';
import 'package:sosial/screens/wrapper.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userprofile>.value(
      value: AuthService().user,
        child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
} 

