import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:swipe_eat/events/event_invite.dart';
import 'package:swipe_eat/events/event_list.dart';
import 'events.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EventViewPage extends StatefulWidget {
  final String name;
  final String description;
  final String startTime;
  final String location;
  final String organizer;

  final List<Tuple2<String, String>> messages = [
    Tuple2("Tom", "Hello everyone"),
    Tuple2("Peter", "Hi"),
    Tuple2("Jonas", "Hey"),
    Tuple2("You", "Hello"),
  ];

  final Map<String, Color> nameColors = {
    "Tom": Colors.red,
    "Peter": Colors.green,
    "Jonas": Colors.purple,
    "You": Colors.blue,
  };

  EventViewPage(
      {required this.name,
      required this.description,
      required this.startTime,
      required this.location,
      this.organizer = ""})
      : super(key: null);

  @override
  EventViewState createState() => EventViewState();
}

class EventViewState extends State<EventViewPage> {
  final List<bool> _selectedMenu = <bool>[true, false, false, false];
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                clipBehavior: Clip.none,
                child: Column(
                  children: [
                    Container(
                      width: width - 22,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 40,
                                  child: BackButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MyEventPage()));
                                    },
                                  ),
                                ),
                                Expanded(
                                    child: Text(
                                  textAlign: TextAlign.center,
                                  widget.name,
                                  style: TextStyle(
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.bold),
                                )),
                                SizedBox(
                                  width: 40,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Divider(
                              color: Colors.blue,
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            constraints: BoxConstraints(
                              minWidth: (width / 4) - 12,
                              minHeight: 40.0,
                            ),
                            isSelected: _selectedMenu,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        /*Text('Info'), SizedBox(width: 5,),*/
                                        Icon(Icons.info)
                                      ])),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        /*Text('Chat'), SizedBox(width: 3,),*/
                                        Icon(Icons.chat)
                                      ])),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        /*Text('Persons'), SizedBox(width: 3,),*/
                                        Icon(Icons.group)
                                      ])),
                              Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        /*Text('Edit'), SizedBox(width: 3,),*/
                                        Icon(Icons.settings)
                                      ])),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (_selectedMenu[0]) ...[
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(widget.description,
                                            textAlign: TextAlign.left,
                                            textScaleFactor: 1.15),
                                      )
                                    ],
                                  ),
                                  if (widget.organizer != "") ...[
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.person),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                          child: InkWell(
                                            child: Text(
                                              widget.organizer,
                                              textScaleFactor: 1.2,
                                              style: TextStyle(
                                                  //color: Colors.indigo,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.watch_later),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: InkWell(
                                          child: Text(
                                            widget.startTime,
                                            textScaleFactor: 1.2,
                                            style: TextStyle(
                                                //color: Colors.indigo,
                                                ),
                                          ),
                                        ),
                                        //onTap: () => launchUrlString("")
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_pin),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: InkWell(
                                            child: Text(
                                              widget.location,
                                              textScaleFactor: 1.2,
                                              style: TextStyle(
                                                color: Colors.indigo,
                                              ),
                                            ),
                                            onTap: () => launchUrlString(
                                                "https://www.google.com/maps/search/?api=1&query=" + Uri.encodeComponent(widget.location))),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                          // chat
                          if (_selectedMenu[1]) ...[
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: [
                                  for (var message in widget.messages)
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              message.item1 == "You"
                                                  ? MainAxisAlignment.start
                                                  : MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.black54)),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 6),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // sender
                                                  Text(
                                                    message.item1,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: widget.nameColors[
                                                          message.item1],
                                                    ),
                                                  ),
                                                  // content
                                                  Text(
                                                    message.item2,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    )
                                ],
                              ),
                            ),
                          ],
                          // participants
                          if (_selectedMenu[2]) ...[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.person),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: InkWell(
                                        child: Text(
                                          "Tom",
                                          textScaleFactor: 1.2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 15,
                                  thickness: 1,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.person),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: InkWell(
                                        child: Text(
                                          "Jonas",
                                          textScaleFactor: 1.2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 15,
                                  thickness: 1,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.person),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: InkWell(
                                        child: Text(
                                          "Peter",
                                          textScaleFactor: 1.2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Flexible(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => EventInvitePage()));
                                        },
                                        child: Text("Invite"),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                          if (_selectedMenu[3]) ...[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                                        child: const Text('Edit'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.orange,
                                          minimumSize: Size(100, 45),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10)),
                                          ),
                                        )
                                      )
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 15,
                                  thickness: 1,
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
                                        child: const Text('Delete'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          minimumSize: Size(100, 45),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(10)),
                                          ),
                                        )
                                      )
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 15,
                                  thickness: 1,
                                ),
                              ],
                            )
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_selectedMenu[1]) ...[
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextField(
                          controller: messageController,
                          decoration: InputDecoration(
                              hintText: "Write message...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            widget.messages
                                .add(Tuple2("You", messageController.text));
                            messageController.clear();
                          });
                        },
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 18,
                        ),
                        backgroundColor: Colors.blue,
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
