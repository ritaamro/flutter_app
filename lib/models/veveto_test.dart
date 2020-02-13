import 'list_item.dart';

class VevetoTest implements ListItem {
  String name;
  DateTime date;
  int currentStep;

  VevetoTest.fromDAO(dynamic order) {
    name = order["Name"];
    date = DateTime.parse(order["OrderedAt"]);
    currentStep = int.parse(order["Status"]);
  }
}
