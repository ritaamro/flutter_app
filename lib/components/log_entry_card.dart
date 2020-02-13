import 'package:flutter/material.dart';
import 'package:veveto_task/models/log_entry.dart';
import 'basic_card.dart';
import 'package:veveto_task/constants.dart';
import 'log_entry_heading.dart';
import 'package:intl/intl.dart';

class LogEntryCard extends StatelessWidget {
  final LogEntry entry;

  LogEntryCard({@required this.entry});

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LogEntryHeading(
            title: entry.type,
          ),
          Text(entry.description,
              style: kSubtitleTextStyle.copyWith(fontSize: 20)),
          SizedBox(
            height: 10.0,
          ),
          Text(DateFormat.yMd().format(entry.date), style: kSubtitleTextStyle),
        ],
      ),
    );
  }
}
