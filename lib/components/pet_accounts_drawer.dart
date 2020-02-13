import 'package:flutter/material.dart';
import 'package:veveto_task/models/Pet.dart';
import 'dog_avatar.dart';

class PetAccountsDrawer extends StatelessWidget {
  PetAccountsDrawer({@required this.pets, @required this.onSelectPet});

  final Function onSelectPet;
  final List<Pet> pets;

  List<DogAvatar> renderPetAccountAvatars() {
    List<DogAvatar> result = [];
    for (Pet p in pets) {
      result.add(DogAvatar(
        pet: p,
        onSelect: onSelectPet,
      ));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: renderPetAccountAvatars(),
    );
  }
}
