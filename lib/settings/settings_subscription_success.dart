import 'package:flutter/material.dart';
import 'package:swipe_eat/authentication/register_base.dart';
import 'package:swipe_eat/events/event_search.dart';
import 'package:swipe_eat/navigation_bar.dart';
import 'package:swipe_eat/settings/settings_main.dart';

class SettingsSubscriptionSuccessPage extends StatefulWidget {
  @override
  SettingsSubscriptionSuccessState createState() => SettingsSubscriptionSuccessState();
}

class SettingsSubscriptionSuccessState extends State<SettingsSubscriptionSuccessPage> {
  String selectedOption = "Select an option!";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Premium Service',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.primary,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                        "Thank you for purchasing our premium service. "
                            "Enjoy your new features!"),
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
                                          builder: (context) => SettingsMainPage()));
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(100, 45),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: Text("Finish"))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
