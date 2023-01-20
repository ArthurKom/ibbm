import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:swipe_eat/events/event_list.dart';
import 'package:swipe_eat/events/event_preview.dart';
import 'package:swipe_eat/events/event_tag.dart';
import 'package:swipe_eat/authentication/login.dart';
import 'package:swipe_eat/events/events.dart';

import 'event_creation_success.dart';

class EventCreatePage extends StatefulWidget {
  @override
  EventCreateState createState() => EventCreateState();
}

class EventCreateState extends State<EventCreatePage> {
  final List<bool> _selectedVisibility = <bool>[true, false];
  final List<bool> _selectedDecisionProcess = <bool>[true, false];
  final List<bool> _selectedLocation = <bool>[true, false];
  TextEditingController controller = TextEditingController();

  String name = "";
  String description = "";
  String startingTime = "";
  String city = "";
  String areaCode = "";
  String streetAndHouseNumber = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      child: BackButton(),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.center,
                        'Create Event',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                  thickness: 1,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text("Location"),
                SizedBox(
                  height: 5.0,
                ),
                ToggleButtons(
                  direction: Axis.horizontal,
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedLocation.length; i++) {
                        _selectedLocation[i] = i == index;
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  constraints: BoxConstraints(
                    minHeight: 40.0,
                    minWidth: width / 2 - 22,
                  ),
                  isSelected: _selectedLocation,
                  children: [
                    SizedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('At my place'), SizedBox(width: 5,), Icon(Icons.home)])),
                    SizedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('At a restaurant'), SizedBox(width: 5,), Icon(Icons.restaurant)])),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Decision Process"),
                SizedBox(
                  height: 5.0,
                ),
                ToggleButtons(
                  direction: Axis.horizontal,
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedDecisionProcess.length; i++) {
                        _selectedDecisionProcess[i] = i == index;
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  constraints: BoxConstraints(
                    minHeight: 40.0,
                    minWidth: width / 2 - 22,
                  ),
                  isSelected: _selectedDecisionProcess,
                  children: [
                    SizedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('Match needs'), SizedBox(width: 5,), Icon(Icons.memory)])),
                    SizedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('I decide'), SizedBox(width: 5,), Icon(Icons.person)])),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Visibility"),
                SizedBox(
                  height: 5.0,
                ),
                ToggleButtons(
                  direction: Axis.horizontal,
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedVisibility.length; i++) {
                        _selectedVisibility[i] = i == index;
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  constraints: BoxConstraints(
                    minHeight: 40.0,
                    minWidth: width / 2 - 22,
                  ),
                  isSelected: _selectedVisibility,
                  children: [
                    SizedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('Public'), SizedBox(width: 5,), Icon(Icons.language)])),
                    SizedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('Private'), SizedBox(width: 5,), Icon(Icons.visibility_off)])),
                  ],
                ),
                // public event?
                if (_selectedVisibility[0] == true) ...[
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: const Text(
                      'Hint: The exact location of your event will not be publicly disclosed. '
                      'People can join your event without an invitation or event code, but can be removed anytime.',
                    ),
                  ),
                ],
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'Name',
                    suffixIcon: Icon(Icons.abc),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                    // control your hints text size
                    hintText: 'Description',
                    suffixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      description = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.none,
                  controller: controller,
                  onTap: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime.now().add(Duration(days: 365 * 2)),
                        onConfirm: (date) {
                          setState(() {
                            startingTime = DateFormat('yyyy-MM-dd | kk:mm').format(date);
                            controller.text = DateFormat('yyyy-MM-dd | kk:mm').format(date);
                          });
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.de);
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'Starting time',
                    suffixIcon: Icon(Icons.watch_later),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'City',
                    suffixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      city = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'Area code',
                    suffixIcon: Icon(Icons.numbers),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      areaCode = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'Street and house number',
                    suffixIcon: Icon(Icons.house),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      streetAndHouseNumber = value;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyEventPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 45),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            child: Text("Cancel"))),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              EventCreationModel.name = name;
                              EventCreationModel.description = description;
                              EventCreationModel.startingTime = startingTime;
                              EventCreationModel.location = streetAndHouseNumber
                                  + ", " + areaCode + " " + city;
                              EventMenuModel.myEvents.add(
                                EventPreview(
                                    name: name,
                                    description: description,
                                    startTime: startingTime,
                                    location: streetAndHouseNumber
                                        + ", " + areaCode + " " + city,
                                    displayType: DisplayType.Details
                                )
                              );
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EatAtHomeTagPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 45),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            child: Text("Continue"))
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
