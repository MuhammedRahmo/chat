
import 'package:chat/server/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat.dart';
import 'login.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  CollectionReference userRef = FirebaseFirestore.instance.collection("Users");
  var user = FirebaseAuth.instance.currentUser!.uid;
  AuthServer authServer = AuthServer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.deepPurple ,
      appBar: AppBar(
        title: Text("Aktif Kullanıcılar",
        style: TextStyle(
          color: Colors.black,
              fontSize: 25
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              onPressed: () {
                authServer.SignOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: userRef.where("id", isNotEqualTo: user).get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, i) {
                    return userItem(quer: snapshot.data.docs[i]);
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class userItem extends StatefulWidget {
  final quer;

  userItem({this.quer});

  @override
  _userItemState createState() => _userItemState();
}

// ignore: camel_case_types
class _userItemState extends State<userItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(3),
          height: 80,
          child: Row(
            children: [
              Container(
                height: 80,
                width: 100,
                child: CircleAvatar(

                  child: Text("${widget.quer["username"]}"[0].toUpperCase()),
                  radius: 60,
                  backgroundColor: Colors.deepPurple,
                ),
              ),
              Text(
                "${widget.quer["username"]}".toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    letterSpacing: 1,
                    fontFamily: "arefRuqaa",
                  color: Colors.black
                ),
              )
            ],
          )),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                // ignore: non_constant_identifier_names
                builder: (_UsersState) =>
                    Chat(userdoce: "${widget.quer["id"]}")));
      },
    );
  }
}
