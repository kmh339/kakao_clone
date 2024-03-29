import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '채팅',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sms),
            color: Colors.black87,
            tooltip: '대화추가',
            onPressed: () => {},
          ),
        ],
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white30,
    );
  }
}
