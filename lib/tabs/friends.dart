import 'package:flutter/material.dart';

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
      body: Text('친구창', style: TextStyle(fontSize: 50, color: Colors.black)),
      backgroundColor: Colors.white30,
    );
  }
}
