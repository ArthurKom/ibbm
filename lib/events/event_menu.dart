import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swipe_eat/events/event_create.dart';
import 'event_join.dart';
import 'event_preview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../navigation_bar.dart';

class EventMenuModel {
  static List<Widget> globalEvents = [
    EventPreview(
      name: "Test",
      description: "This is my test description. Do you like it?",
      location: "Darmstadt",
      startTime: "16.01.2023 | 19:15",
      displayType: DisplayType.Details,
    ),
    EventPreview(
      name: "Test 2",
      description: "This is my second test description. Do you like it as well?",
      location: "Frankfurt",
      startTime: "20.02.2023 | 17:00",
      displayType: DisplayType.Details,
    ),
    EventPreview(
      name: "Test",
      description: "This is my test description. Do you like it?",
      location: "Darmstadt",
      startTime: "16.01.2023 | 19:15",
      displayType: DisplayType.Details,
    ),
    EventPreview(
      name: "Test 2",
      description: "This is my second test description. Do you like it as well?",
      location: "Frankfurt",
      startTime: "20.02.2023 | 17:00",
      displayType: DisplayType.Details,
    ),
    EventPreview(
      name: "Test",
      description: "This is my test description. Do you like it?",
      location: "Darmstadt",
      startTime: "16.01.2023 | 19:15",
      displayType: DisplayType.Details,
    ),
    EventPreview(
      name: "Test 2",
      description: "This is my second test description. Do you like it as well?",
      location: "Frankfurt",
      startTime: "20.02.2023 | 17:00",
      displayType: DisplayType.Details,
    ),
  ];

  static List<Widget> invitations = [
    EventPreview(
      name: "Test",
      description: "This is my test description. I am inviting you. Do you like it?",
      location: "Schustergasse 18, 64283 Darmstadt",
      startTime: "16.01.2023 | 19:15",
      organizer: "Tim",
      displayType: DisplayType.Invitation,
    ),
    EventPreview(
      name: "Request - Arthur",
      description: "Arthur would like to join your event.",
      location: "Schustergasse 18, 64283 Darmstadt",
      startTime: "16.01.2023 | 19:15",
      organizer: "You",
      displayType: DisplayType.ReceivedRequest,
    ),
    EventPreview(
      name: "Your request",
      description: "You would like to join the event of Tim.",
      location: "Waldstrasse 18, 64283 Darmstadt",
      startTime: "16.01.2023 | 19:15",
      organizer: "Tim",
      displayType: DisplayType.SendRequest,
    ),
  ];

  static List<Widget> myEvents = [

  ];
}

class EventMenuPage extends StatefulWidget {
  @override
  EventMenuState createState() => EventMenuState();
}

class EventMenuState extends State<EventMenuPage> {
  final List<bool> _selectedMenu = <bool>[true, false, false];

  bool radiusDropDownExpanded = false;
  String radius = "3 km";
  List<String> radiusList = [
    '1 km',
    '2 km',
    '3 km',
    '5 km',
    '10 km',
  ];

  int navigationIndex = 0;

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
                Container(
                  width: width - 22,
                  decoration: BoxDecoration(
                    // add border
                      border: Border.all(width: 1, color: Colors.transparent),
                      // set border radius
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Events',
                                  style: TextStyle(
                                      fontSize: 21.0, fontWeight: FontWeight.bold),
                                )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Divider(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ToggleButtons(
                        direction: Axis.horizontal,
                        onPressed: (int index) {
                          setState(() {
                            // The button that is tapped is set to true, and the others to false.
                            for (int i = 0; i < _selectedMenu.length; i++) {
                              _selectedMenu[i] = i == index;
                            }
                          });
                        },
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        constraints: BoxConstraints(
                          minWidth: (width / 3) - 15.34,
                          minHeight: 40.0,
                        ),
                        isSelected: _selectedMenu,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text('Search'), SizedBox(width: 3,), Icon(Icons.search)])),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text('Personal'), SizedBox(width: 5,), Icon(Icons.list_alt)])),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [Text('Invitations'), SizedBox(width: 5,), Icon(Icons.mail)])),
                        ],
                      ),
                      // Search
                      if (_selectedMenu[0]) ...[
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // radiusDropDownExpanded = !radiusDropDownExpanded;
                                });
                              },
                              child: Container(
                                height: 30,
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 1, color: Colors.black54),
                                ),
                                child:
                                Row(
                                  textBaseline: TextBaseline.alphabetic,
                                  crossAxisAlignment: CrossAxisAlignment.baseline,
                                  children: [
                                    Text(
                                      "In radius:",
                                      style: TextStyle(
                                          fontSize: 14
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    DropdownButton(
                                      onTap: () {
                                        setState(() {
                                          //radiusDropDownExpanded = !radiusDropDownExpanded;
                                        });
                                      },
                                      value: radius,
                                      items: [
                                        DropdownMenuItem(
                                          value: "1 km",
                                          child: Text("1 km"),
                                        ),
                                        DropdownMenuItem(
                                          value: "2 km",
                                          child: Text("2 km"),
                                        ),
                                        DropdownMenuItem(
                                          value: "3 km",
                                          child: Text("3 km"),
                                        ),
                                        DropdownMenuItem(
                                          value: "5 km",
                                          child: Text("5 km"),
                                        ),
                                        DropdownMenuItem(
                                          value: "10 km",
                                          child: Text("10 km"),
                                        ),
                                      ],
                                      underline: Container(),
                                      isDense: true,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black
                                      ),//remove underline
                                      onChanged: (value) {
                                        setState(() {
                                          if (value != null) {
                                            radius = value;
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          children: [
                            // search
                            if (_selectedMenu[0] == true) ...[
                              if (EventMenuModel.globalEvents.isEmpty) ...[
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("There are no events in your selected area.",)
                                  ],
                                )
                              ],
                              for (var event in EventMenuModel.globalEvents)  Column(
                                children: [
                                  event,
                                  SizedBox(height: 15,),
                                ],
                              )
                            ],
                            // personal
                            if (_selectedMenu[1] == true) ...[
                              if (EventMenuModel.myEvents.isEmpty) ...[
                                Text("You did not create or join any events."),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => EatAtHomeCreatePage())
                                        );
                                      },
                                      child: Text("Create"),
                                    )
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => JoinGroup())
                                          );
                                        },
                                        child: Text("Join"),
                                      )
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              for (var event in EventMenuModel.myEvents) Column(
                                children: [
                                  event,
                                  SizedBox(height: 15,),
                                ],
                              )
                            ],
                            // invitations
                            if (_selectedMenu[2] == true) ...[
                              if (EventMenuModel.invitations.isEmpty) ...[
                                Text("You have not received any invitations.")
                              ],
                              for (var event in EventMenuModel.invitations) Column(
                                children: [
                                  event,
                                  SizedBox(height: 15,),
                                ],
                              )
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () { },
      ),*/
      bottomNavigationBar: Navbar(
        navigationIndex: 1,
      ),
    );
  }
}
