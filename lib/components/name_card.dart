import 'package:flutter/material.dart';
import 'package:veveto_task/constants.dart';
import 'text_icon_button.dart';
import 'card_subInfo_row.dart';
import 'package:veveto_task/models/Pet.dart';
import 'basic_card.dart';

class NameCard extends StatelessWidget {
  final Pet pet;

  NameCard({@required this.pet});

  @override
  Widget build(BuildContext context) {
    return BasicCard(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('${pet.name}', style: kMainTitleTextStyle),
              text_icon_button(),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: CardSubInfoRow(
                partA: 'Vet Number', partB: '${pet.vetPhoneNumber}'),
          ),
          CardSubInfoRow(partA: 'Vet Name', partB: '${pet.vetName}'),
        ],
      ),
    );
  }
}
