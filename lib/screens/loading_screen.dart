import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:veveto_task/constants.dart';
import 'package:veveto_task/services/ApiHandler.dart';
import 'package:veveto_task/models/Pet.dart';
import 'diary_screen.dart';

const int userID = 1;
const logLimit = 1;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  void getUserData() async {
    ApiHandler apiHandler = new ApiHandler('http://192.168.0.103:3000/api/v1');

    List<Pet> pets = await apiHandler.getUserPetData(userID);

    if (pets.length >= 1) {
      await apiHandler.getPetInfo(pets[0]);
      var orders = await apiHandler.getUserOrdersForPet(pets[0].petID);

      var logs = await apiHandler.getUserLogsForPet(pets[0].petID, null, null);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DiaryScreen(pets: pets, orders: orders, logs: logs);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veveto'),
      ),
      body: Center(
        child: SpinKitRotatingCircle(color: kAccentColor),
      ),
    );
  }
}
