import 'package:flutter/material.dart';
import 'package:veveto_task/constants.dart';

class LogEntryHeading extends StatelessWidget {
  const LogEntryHeading({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 14.0,
            backgroundColor: kIconsBGColors[title],
            child: Icon(kIcons[title], size: 14.0, color: Colors.white),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
