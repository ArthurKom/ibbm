import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../navigation_bar.dart';
import 'events.dart';

class EventInvitationsPage extends StatefulWidget {
  @override
  EventInvitationsState createState() => EventInvitationsState();
}

class EventInvitationsState extends State<EventInvitationsPage> {

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
                                  'Invitations',
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
                      Container(
                        child: Column(
                          children: [
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
        navigationIndex: 2,
      ),
    );
  }
}
