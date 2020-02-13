import 'package:flutter/material.dart';
import 'package:veveto_task/components/log_entry_card.dart';
import 'package:veveto_task/constants.dart';
import 'package:veveto_task/components/pet_accounts_drawer.dart';
import 'package:veveto_task/components/name_card.dart';
import 'package:veveto_task/models/Pet.dart';
import 'package:veveto_task/models/list_item.dart';
import 'package:veveto_task/models/log_entry.dart';
import 'package:veveto_task/models/veveto_test.dart';
import 'package:veveto_task/components/veveto_product_card.dart';
import 'package:veveto_task/components/list_view_button.dart';
import 'package:veveto_task/services/ApiHandler.dart';

class DiaryScreen extends StatefulWidget {
  final List<Pet> pets;
  final List<VevetoTest> orders;
  final Pet selectedPetAccount;
  List<LogEntry> logs;

  DiaryScreen(
      {@required this.pets, this.orders, this.logs, this.selectedPetAccount});

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  Pet selectedPetAccount;
  List<ListItem> items = [];
  bool loadedAll = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    onSelectPet(widget.selectedPetAccount != null
        ? widget.selectedPetAccount
        : widget.pets[0]);
    curateItemsList();
  }

  void onSelectPet(Pet pet) {
    setState(() {
      pet.selected = true;
      if (selectedPetAccount != null) selectedPetAccount.selected = false;
      selectedPetAccount = pet;
    });
  }

  void curateItemsList() {
    items = [
      [selectedPetAccount],
      widget.orders,
      widget.logs
    ].expand((e) => e).toList();
  }

  void loadMoreLogs() async {
    ApiHandler apiHandler = new ApiHandler('http://192.168.0.103:3000/api/v1');

    var logs =
        await apiHandler.getUserLogsForPet(selectedPetAccount.petID, -1, -1);

    if (logs.length >= 1) {
      widget.logs = logs;
      setState(() {
        loadedAll = true;
        curateItemsList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veveto'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        elevation: 20,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'Home',
              style: kSubtitleTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text(
              'Tagebuch',
              style: kSubtitleTextStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text(
              'Menu',
              style: kSubtitleTextStyle,
            ),
          ),
        ],
        currentIndex: 1,
        selectedItemColor: kAccentColor,
        onTap: (index) {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(kScreenContainerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {
                    //TODO: implement adding new pet account
                  },
                  constraints: BoxConstraints(minWidth: 50.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  child: Text('New', style: kFlatButtonWithBorderTextStyle),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: kAccentColor,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                PetAccountsDrawer(
                  pets: widget.pets,
                  onSelectPet: onSelectPet,
                )
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (index == items.length)
                    return ListViewButton(onTap: loadMoreLogs);
                  final item = items[index];
                  if (item is Pet)
                    return NameCard(pet: item);
                  else if (item is VevetoTest)
                    return VevetoProductCard(product: item);
                  else if (item is LogEntry)
                    return LogEntryCard(entry: item);
                  else
                    return null;
                },
                itemCount: loadedAll ? items.length : items.length + 1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: add new long entry
        },
        child: Icon(Icons.add),
        backgroundColor: kAccentColor,
      ),
    );
  }
}
