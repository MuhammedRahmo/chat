
import 'package:chat/server/auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class forgotPass extends StatefulWidget {
  @override
  _forgotPassState createState() => _forgotPassState();
}
// ignore: camel_case_types
class _forgotPassState extends State<forgotPass> {

  final TextEditingController emailCon=TextEditingController();
  AuthServer authServer=AuthServer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "reset_password",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,letterSpacing: 2,
                fontFamily: "arefRuqaa"
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    labelText: "email",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Colors.deepPurple)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(color: Colors.deepPurple)
                    )
                ),
                controller: emailCon,
              ),
              SizedBox(height: 20,),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.deepPurple,
                onPressed: (){
                  // ignore: unnecessary_null_comparison
                  if(emailCon.text!=null){
                    authServer.ResetPass(emailCon.text, context);
                  }
                },
                child: Text("send"),
                textColor: Colors.black,
              ),
            ],
          ),
        )
    );
  }
}