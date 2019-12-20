import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Friends extends StatelessWidget {
  Friends({this.ftitle, this.friendsRef});
  final String ftitle;
  final friendsRef;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ftitle,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_add),
            color: Colors.black87,
            tooltip: '친구 추가',
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black87,
            tooltip: 'search',
            onPressed: () => {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(9),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.black26,
            child: const Center(
              child: Text('hi'),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white30,
    );
  }
}
