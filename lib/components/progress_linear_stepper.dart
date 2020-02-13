import 'package:flutter/material.dart';
import 'package:veveto_task/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'progress_step_label.dart';

class ProgressLinearStepper extends StatelessWidget {
  ProgressLinearStepper(
      {@required this.progressSteps, @required this.currentStepIndex});

  final List<String> progressSteps;
  final int currentStepIndex;

  double currentProgressPercentage() {
    double percentageJumpPerStep = 1 / (progressSteps.length - 1);
    return percentageJumpPerStep * currentStepIndex.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        LinearPercentIndicator(
          lineHeight: kProgressStepperLineHeight,
          percent: currentProgressPercentage(),
          progressColor: kProgressStepperPercentageColor,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 22.0),
          child: renderMilestones(),
        ),
      ],
    );
  }

  Column renderMilestones() {
    List<Container> milestones = [];
    List<ProgressStepLabel> labels = [];

    for (int i = 0; i < progressSteps.length; i++) {
      milestones.add(
        Container(
          width: kProgressMilestoneRadius,
          height: kProgressMilestoneRadius,
          decoration: new BoxDecoration(
            color: i <= currentStepIndex
                ? kProgressStepperPercentageColor
                : kProgressStepperDefaultColor,
            shape: BoxShape.circle,
          ),
        ),
      );

      labels.add(ProgressStepLabel(label: progressSteps[i]));
    }

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: milestones,
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: labels,
        ),
      ],
    );
  }
}
