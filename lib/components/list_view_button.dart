import 'package:flutter/material.dart';
import 'package:veveto_task/constants.dart';

class ListViewButton extends StatelessWidget {
  ListViewButton({@required this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          kLoadMoreIcon,
          SizedBox(width: 10.0),
          Text(kLoadMoreBtnText, style: kLoadMoreBtnTextStyle),
        ],
      ),
    );
  }
}
