
import 'package:chat/register.dart';
import 'package:chat/restPass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Users.dart';
import 'login.dart';

bool isLogin=false;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if(user==null){
    isLogin=false;
  }else{
    isLogin=true;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  isLogin==false?LoginPage() : Users(),
      routes: {
        "users" : (context) => Users(),
        "login" : (context) => LoginPage(),
        "register" : (context) => Register(),
        "forgotPass" : (context)=> forgotPass(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}



