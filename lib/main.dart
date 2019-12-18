import 'dart:ui';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'friends.dart';
import 'chat.dart';
import 'settings.dart';

// Future<void> main() async {
//   final FirebaseApp app = await FirebaseApp.configure(
//     name: 'test',
//     options: const FirebaseOptions(
//       googleAppID: '1:881954261126:android:a8f3bba3f252f9a241a907',
//       gcmSenderID: '881954261126',
//       apiKey:
//           'AAAAzViSCIY:APA91bHh1Z1-ikZ_-pNSPnogwpt4PcQWOwAGWd5yQzb-1KloDlRVYgkaZFWlcYTd30osx5b4hP0l8hTwBoTa7j1-CxNAXSxNUOJjkaP9nRoqAIfs9ooox-xUkA2KFB9OwPJxROgMhq1y',
//       projectID: 'kakao-28a1a',
//     ),
//   );
//   final Firestore firestore = Firestore(app: app);

//   runApp(MaterialApp(title: 'Firestore Example', home: MyTabs()));
// }

void main() => runApp(MaterialApp(home: MyTabs()));

// TabController 객체를 멤버로 만들어서 상태를 유지하기 때문에 StatefulWidget 클래스 사용
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: controller, // 컨트롤러 연결
          children: [Friends(), Chat(), Settings()]),
      bottomNavigationBar: Container(
        child: TabBar(controller: controller, // 컨트롤러 연결
            tabs: [
              // 아이콘은 글자 수 같은 걸로 선택. 의미 없음. 제목에 들어간 색상은 중요.
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
