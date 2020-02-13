import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:veveto_task/models/veveto_test.dart';
import 'package:veveto_task/models/Pet.dart';
import 'package:veveto_task/models/log_entry.dart';
import 'package:veveto_task/screens/loading_screen.dart';

class ApiHandler {
  ApiHandler(this.baseURL);

  final String baseURL;

  Future getPetInfo(Pet pet) async {
    var response = await getData('/pets/${pet.petID}');
    pet.setNameCardInfo(response);
  }

  Future<List<VevetoTest>> getUserOrdersForPet(int petID) async {
    var response = await getData('/orders/?userID=$userID&&petID=$petID');
    List<VevetoTest> orders = [];

    for (dynamic order in response != null ? response["orders"] : []) {
      orders.add(new VevetoTest.fromDAO(order));
    }

    return orders;
  }

  Future<List<LogEntry>> getUserLogsForPet(int petID, int l, int o) async {
    int limit = l != null ? l : 3;
    int offset = o != null ? o : -1;

    var response = await getData(
        '/diary/?userID=$userID&&petID=$petID&&offset=$offset&&limit=$limit');
    List<LogEntry> logs = [];

    for (dynamic entry in response != null ? response["logs"] : []) {
      logs.add(new LogEntry.fromDAO(entry));
    }

    return logs;
  }

  Future<List<Pet>> getUserPetData(int userID) async {
    List<Pet> pets = [];

    var userData = await getData('/users/pets/$userID');
    for (dynamic pet in userData != null ? userData["pets"] : []) {
      pets.add(new Pet(petID: pet["PetID"], name: pet["Name"]));
    }

    return pets;
  }

  Future getData(route) async {
    try {
      http.Response response = await http.get(baseURL + route);

      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      }
    } catch (error) {
      print("server cannot be reached.");
    }
  }
}
