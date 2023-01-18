import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swipe_eat/events/event_create.dart';
import 'event_join.dart';

import '../navigation_bar.dart';
import 'event_menu.dart';

class MyEventPage extends StatefulWidget {
  @override
  MyEventState createState() => MyEventState();
}

class MyEventState extends State<MyEventPage> {
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
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
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
                            )),
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
                            Row(
                              children: [
                                Expanded(
                                    child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EatAtHomeCreatePage()));
                                  },
                                  child: Text("Create"),
                                )),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => JoinGroup()));
                                  },
                                  child: Text("Join"),
                                )),
                              ],
                            ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: Navbar(
        navigationIndex: 1,
      ),
    );
  }
}
