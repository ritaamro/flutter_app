import 'package:flutter/material.dart';
import 'package:veveto_task/constants.dart';

class CardSubInfoRow extends StatelessWidget {
  CardSubInfoRow({this.partA, this.partB});

  final String partA;
  final String partB;

  List<Widget> renderContent() {
    List<Widget> subInfo = [];
    if (partA != null) subInfo.add(Text(partA, style: kSubtitleTextStyle));
    if (partB != null) subInfo.add(Text(partB, style: kSubtitleTextStyle));

    return subInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: renderContent(),
    );
  }
}
