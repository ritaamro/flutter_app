import 'package:flutter/material.dart';
import 'package:veveto_task/constants.dart';

class BasicCard extends StatelessWidget {
  final Widget child;

  BasicCard({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kCardBorderRadius),
        ),
        elevation: kCardElevation,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15.0),
          child: this.child,
        ),
      ),
    );
  }
}
