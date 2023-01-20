import 'package:flutter/material.dart';
import 'package:swipe_eat/navigation_bar.dart';
import 'events.dart';
import 'event_preview.dart';

class EventSearchPage extends StatefulWidget {
  @override
  EventSearchState createState() => EventSearchState();
}

class EventSearchState extends State<EventSearchPage> {
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
            clipBehavior: Clip.none,
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
                      SizedBox(height: 20,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                'Search',
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
                      // Search
                      SizedBox(
                        height: 6,
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
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          children: [
                            // search
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
      bottomNavigationBar: Navbar(navigationIndex: 0),
    );
  }
}
