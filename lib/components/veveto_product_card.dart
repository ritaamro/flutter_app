import 'package:flutter/material.dart';
import 'package:veveto_task/components/basic_card.dart';
import 'log_entry_heading.dart';
import 'package:veveto_task/models/veveto_test.dart';
import 'card_subInfo_row.dart';
import 'progress_linear_stepper.dart';
import 'package:intl/intl.dart';

class VevetoProductCard extends StatelessWidget {
  VevetoProductCard({this.product});

  final VevetoTest product;

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      child: Column(
        children: <Widget>[
          LogEntryHeading(title: 'veveto Products'),
          CardSubInfoRow(
            partA: product.name,
            partB: DateFormat.yMd().format(product.date),
          ),
          ProgressLinearStepper(
            progressSteps: ["Sammein", "Analysieren", "Entdecken"],
            currentStepIndex: product.currentStep,
          ),
        ],
      ),
    );
  }
}
