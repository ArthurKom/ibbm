import 'package:flutter/material.dart';
import 'package:swipe_eat/eat_at_home_create.dart';
import 'package:swipe_eat/eat_at_home_creation_success.dart';
import 'package:swipe_eat/login.dart';
import 'register_base.dart';
import 'tag_selection.dart';

class EatAtHomeTagPage extends StatefulWidget {
  @override
  EatAtHomeTagState createState() => EatAtHomeTagState();
}

class EatAtHomeTagState extends State<EatAtHomeTagPage> {

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create Event',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                  thickness: 1,
                ),
                /*SizedBox(
                  height: 10.0,
                ),
                Text("Here you can add predefined tags to describe your event as precisely as possible."), */
                SizedBox(
                  height: 20.0,
                ),
                FoodTagSelection(),
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
                                      builder: (context) => EatAtHomeCreatePage()));
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 45),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            child: Text("Back"))),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EatAtHomeCreationSuccessPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 45),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            child: Text("Create"))),
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
