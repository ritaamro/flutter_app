import 'package:flutter/material.dart';
import 'package:veveto_task/constants.dart';

class ProgressStepLabel extends StatelessWidget {
  ProgressStepLabel({this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: kSubtitleTextStyle.copyWith(fontSize: kProgressLabelFontSize),
    );
  }
}
