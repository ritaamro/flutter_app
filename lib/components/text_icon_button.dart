import 'package:flutter/material.dart';
import 'package:veveto_task/constants.dart';

class text_icon_button extends StatelessWidget {
  const text_icon_button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        //TODO: show me my characteristics
      },
      child: Row(
        children: <Widget>[
          Text(
            'Steckbrief',
            style: kAccentTextStyle,
          ),
          SizedBox(
            width: 5.0,
          ),
          Icon(
            Icons.remove_red_eye,
            color: kAccentColor,
          ),
        ],
      ),
    );
  }
}
