import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:swipe_eat/events/event_create.dart';
import 'event_join.dart';

import '../navigation_bar.dart';
import 'events.dart';
import 'event_search.dart';

class MyEventPage extends StatefulWidget {
  @override
  MyEventState createState() => MyEventState();
}

class MyEventState extends State<MyEventPage> {
  ValueNotifier<bool> isDialOpen = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Container(
                  width: width - 22,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
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
                              'My Events',
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
                        height: 2,
                      ),
                      Container(
                        child: Column(
                          children: [
                            if (EventMenuModel.myEvents.isEmpty) ...[
                              SizedBox(
                                height: 5,
                              ),
                              Text("You did not create or join any events."),
                            ],
                            SizedBox(
                              height: 10,
                            ),
                            for (var event in EventMenuModel.myEvents)
                              Column(
                                children: [
                                  event,
                                  SizedBox(
                                    height: 15,
                                  ),
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
      floatingActionButton: SpeedDial(
        buttonSize: Size.square(50),
        icon: Icons.add,
        activeIcon: Icons.close,
        openCloseDial: isDialOpen,
        label: const Text("New"),
        activeLabel: const Text("Close"),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.create),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            label: 'Create',
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => EventCreatePage()));
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.login),
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            label: 'Join',
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => JoinGroup()));
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.search),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            label: 'Search',
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => EventSearchPage()));
            },
          ),
        ],
      ),
      bottomNavigationBar: Navbar(
        navigationIndex: 1,
      ),
    );
  }
}
