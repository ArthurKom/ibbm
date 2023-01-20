import 'package:flutter/material.dart';
import 'package:swipe_eat/authentication/register_base.dart';
import 'package:swipe_eat/events/event_search.dart';
import 'package:swipe_eat/navigation_bar.dart';
import 'package:swipe_eat/settings/settings_subscription_success.dart';

class SettingsSubscriptionPage extends StatefulWidget {
  @override
  SettingsSubscriptionState createState() => SettingsSubscriptionState();
}

class SettingsSubscriptionState extends State<SettingsSubscriptionPage> {
  String selectedOption = "Select an option!";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      /*decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.lightBlueAccent,
            Colors.lightBlue,
          ]
        )
      ),*/
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue[50]!, Colors.blue[100]!])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: <Widget>[
                                  Text(
                                    'Event Filtering',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 2
                                        ..color = Colors.lightBlueAccent,
                                    ),
                                  ),
                                  Text(
                                    'Event Filtering',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: <Widget>[
                                  Text(
                                    '∞ Private Events',
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 2
                                        ..color = Colors.lightBlueAccent,
                                    ),
                                  ),
                                  Text(
                                    '∞ Private Events',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: <Widget>[
                                  Text(
                                    '∞ Public Events',
                                    style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 2
                                        ..color = Colors.lightBlueAccent,
                                    ),
                                  ),
                                  Text(
                                    '∞ Public Events',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: <Widget>[
                                  Text(
                                    '∞ Matching',
                                    style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 2
                                        ..color = Colors.lightBlueAccent,
                                    ),
                                  ),
                                  Text(
                                    '∞ Matching',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.lightBlue,
                                  Colors.blueAccent,
                                  //Colors.blue,
                                  Colors.lightBlueAccent,
                                ]
                              ),
                              border: Border.all(color: Colors.lightBlueAccent, width: 3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 80,
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedOption = "Buy for 1 Month for 6.99 €";
                                    });
                                  },
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("1 Month",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("6.99 €",
                                          style: TextStyle(
                                              fontSize: 15
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  ),
                                ),
                                VerticalDivider(
                                  thickness: 3,
                                  color: Colors.lightBlueAccent[200]!,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedOption = "Buy for 4 Month for 19.96 €";
                                        });
                                      },
                                      child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("4 Month",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("19.96 €",
                                            style: TextStyle(
                                              fontSize: 15
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ),
                                ),
                                VerticalDivider(
                                  thickness: 3,
                                  color: Colors.lightBlueAccent,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedOption = "Buy for 1 Year for 35.88 €";
                                      });
                                    },
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("1 Year",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("35.88 €",
                                            style: TextStyle(
                                                fontSize: 15
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.lightBlueAccent, width: 3),
                            ),
                            child:ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            //shape: ,
                                            minimumSize: MaterialStateProperty.all(Size(100, 50)),
                                            //foregroundColor: MaterialStateProperty.all(Colors.white),
                                            //backgroundColor: MaterialStateProperty.all(Colors.indigo),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) => SettingsSubscriptionSuccessPage()));
                                          },
                                          child: Text(selectedOption,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                            ),
                                          )
                                      )
                                  ),
                                ],
                              ),
                            ) ,
                          ),
                          SizedBox(height: 20.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context,true);
                            },
                            child: Column(children: <Widget>[
                              const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.indigo,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}
