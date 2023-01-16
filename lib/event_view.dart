import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'event_preview.dart';

class EventViewPage extends StatefulWidget {
  @override
  EventViewState createState() => EventViewState();
}

class EventViewState extends State<EventViewPage> {
  final List<bool> _selectedMenu = <bool>[true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width - 22,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                'Birthday Party',
                                style: TextStyle(
                                    fontSize: 21.0, fontWeight: FontWeight.bold),
                              )
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
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        constraints: BoxConstraints(
                          minWidth: (width / 5) - 9.6,
                          minHeight: 40.0,
                        ),
                        isSelected: _selectedMenu,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [/*Text('Info'), SizedBox(width: 5,),*/ Icon(Icons.info)])),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [/*Text('Chat'), SizedBox(width: 3,),*/ Icon(Icons.chat)])),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [/*Text('Persons'), SizedBox(width: 3,),*/ Icon(Icons.group)])),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [/*Text('Edit'), SizedBox(width: 3,),*/ Icon(Icons.edit)])),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [/*Text('Delete'), SizedBox(width: 3,),*/ Icon(Icons.delete)])),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Text("Welcome to my birthday party."
                                " We are going to eat pizza at my place."
                                " We are going to eat pizza at my place."
                                " We are going to eat pizza at my place."
                                " We are going to eat pizza at my place."
                                " We are going to eat pizza at my place."
                                " We are going to eat pizza at my place."
                                " We are going to eat pizza at my place."
                                " We are going to eat pizza at my place."
                                , textScaleFactor: 1.15),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: [
                                Icon(Icons.watch_later),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: InkWell(
                                    child: Flexible(
                                      child: Text(
                                        "19.04.2023 | 19:30",
                                        textScaleFactor: 1.2,
                                        style: TextStyle(
                                          //color: Colors.indigo,
                                        ),
                                      ),
                                    ),
                                    //onTap: () => launchUrlString("")
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_pin),
                                SizedBox(width: 10,),
                                Expanded(
                                  child: InkWell(
                                      child: Flexible(
                                        child: Text(
                                          "Schustergasse 18, 64283 Darmstadt",
                                          textScaleFactor: 1.2,
                                          style: TextStyle(
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrlString("https://www.google.com/maps/search/?api=1&query=Schustergasse+18%2C+64283+Darmstadt")
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Back'),
                          ]
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 45),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                        )
                      )
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
