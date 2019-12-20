import 'dart:ui';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import './tabs/chat.dart';
import './tabs/friends.dart';
import './tabs/settings.dart';

void main() => runApp(MaterialApp(home: MyTabs()));

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void createDBTest() {
    FirebaseDatabase.instance
        .reference()
        .child('recent')
        .child('id')
        .set({'title': 'bye'});
  }

  @override
  Widget build(BuildContext context) {
    //createDBTest();

    return Scaffold(
      body: TabBarView(controller: controller, // 컨트롤러 연결
          children: [Friends(), Chat(), Settings()]),
      bottomNavigationBar: Container(
        child: TabBar(controller: controller, // 컨트롤러 연결
            tabs: [
              Tab(icon: Icon(Icons.person_pin), text: '친구'),
              Tab(
                icon: Icon(Icons.mode_comment),
                text: '대화',
              ),
              Tab(icon: Icon(Icons.settings_applications), text: '설정'),
            ]),
        color: Colors.blueGrey,
      ),
    );
  }
}
