import 'package:flutter/cupertino.dart';
import 'list_item.dart';

class Pet implements ListItem {
  int petID;
  String name;
  int vetID;
  String vetName;
  String vetPhoneNumber;
  String imageURL;
  bool _isSelected;

  Pet({@required this.petID, @required this.name}) {
    this._isSelected = false;
  }

  void setNameCardInfo(dynamic petData) {
    this.vetID = petData["VetID"];
    this.vetName = petData["VetName"];
    this.vetPhoneNumber = petData["VetPhoneNumber"];
    this.imageURL = petData["ImageURL"];
  }

  bool get isSelected {
    return this._isSelected;
  }

  set selected(bool value) {
    this._isSelected = value;
  }
}
