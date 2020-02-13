import 'dart:ui';
import 'package:veveto_task/models/Pet.dart';
import 'package:flutter/material.dart';
import 'package:veveto_task/constants.dart';

class DogAvatar extends StatelessWidget {
  DogAvatar({@required this.onSelect, @required this.pet});

  final Pet pet;
  final Function onSelect;

  double getRadius() {
    return pet.isSelected ? kSelectedAccountAvatarRadius : kAccountAvatarRadius;
  }

  Widget renderAvatar() {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      width: getRadius(),
      height: getRadius(),
      decoration: BoxDecoration(
        image: pet.imageURL != null
            ? DecorationImage(
                image: NetworkImage(pet.imageURL),
                fit: BoxFit.cover,
              )
            : null,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(
          color: Colors.teal.shade100.withOpacity(pet.isSelected ? 1.0 : 0.0),
          width: 3.0,
        ),
      ),
      child: pet.imageURL == null
          ? CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: Text(
                pet.name.substring(0, 2),
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(pet),
      child: renderAvatar(),
    );
  }
}
