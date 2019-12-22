import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

class Friends extends StatelessWidget {
  Friends({this.ftitle, this.dbRef});
  final String ftitle;
  final dbRef;

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
      body: Container(
        child: FutureBuilder(
          future: MakeCall().firebaseCalls(dbRef),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('wait');
              case ConnectionState.waiting:
                return Text('Loading');
              default:
                if (!snapshot.hasError) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, int index) {
                      return InkWell(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: 'Tap the ${snapshot.data[index].friendName}',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        splashColor: Colors.red[400],
                        child: Card(
                          elevation: 0.0,
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Image.network(snapshot.data[index].iconUrl,
                                        height: 100, width: 100),
                                    Padding(
                                      padding: EdgeInsets.only(right: 20),
                                    ),
                                    Text(
                                      snapshot.data[index].friendName,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 120),
                                    ),
                                    Text(
                                      snapshot.data[index].friendState,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Text('Error : ${snapshot.error}');
                }
            }
          },
        ),
        color: Colors.black12,
      ),
      backgroundColor: Colors.white30,
    );
  }
}

class FriendDetailListItem {
  String friendName;
  String iconUrl;
  String friendState;

  FriendDetailListItem({this.friendName, this.iconUrl, this.friendState});

  factory FriendDetailListItem.fromJson(Map<dynamic, dynamic> parsedJson) {
    return FriendDetailListItem(
        friendName: parsedJson['name'],
        iconUrl: parsedJson['photo'],
        friendState: parsedJson['state']);
  }
}

class FriendList {
  List<FriendDetailListItem> friendList;

  FriendList({this.friendList});

  factory FriendList.fromJson(Map<dynamic, dynamic> json) {
    return FriendList(friendList: parseFriends(json));
  }

  static List<FriendDetailListItem> parseFriends(friendJSON) {
    var fList = friendJSON['browseFriends'] as List;

    List<FriendDetailListItem> friendList =
        fList.map((data) => FriendDetailListItem.fromJson(data)).toList();

    return friendList;
  }
}

class MakeCall {
  List<FriendDetailListItem> listItems = [];

  Future<List<FriendDetailListItem>> firebaseCalls(
      DatabaseReference databaseReference) async {
    FriendList friendList;
    DataSnapshot dataSnapshot = await databaseReference.once();
    Map<dynamic, dynamic> jsonResponse = dataSnapshot.value['contents'];
    friendList = new FriendList.fromJson(jsonResponse);
    listItems.addAll(friendList.friendList);

    return listItems;
  }
}
