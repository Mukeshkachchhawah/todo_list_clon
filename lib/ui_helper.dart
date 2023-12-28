import 'package:flutter/material.dart';

Widget hSpectre({double mHeight = 11.0}) {
  return SizedBox(
    height: mHeight,
  );
}

Widget wSpecher({double mWidth = 11.0}) {
  return SizedBox(
    width: mWidth,
  );
}

class Constants {
  static const List<Map<String, dynamic>> arrList = [
    {
      "title": "My Task",
      "Image": "assets/images/task.png",
      "subtitle": "32 new task added"
    },
    {
      "title": "My Ticket",
      "Image": "assets/images/task-list-png.png",
      "subtitle": "You have 424 Ticket"
    },
    {
      "title": "Report",
      "Image": "assets/images/analytics-icon-8.png",
      "subtitle": "see all your report"
    },
    {
      "title": "My Profile",
      "Image": "assets/images/profile.png",
      "subtitle": "saad inn Sayeed"
    }
  ];
}
