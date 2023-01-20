import 'package:flutter/material.dart';
import 'package:swipe_eat/authentication/login.dart';
import 'package:swipe_eat/authentication/register_base.dart';
import 'package:swipe_eat/events/event_search.dart';
import 'package:swipe_eat/navigation_bar.dart';
import 'package:swipe_eat/settings/settings_subscription.dart';

class SettingsMainPage extends StatefulWidget {
  @override
  SettingsMainState createState() => SettingsMainState();
}

class SettingsMainState extends State<SettingsMainPage> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
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
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Personal Information",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                            Icon(Icons.person)
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => SettingsSubscriptionPage()));
                        },
                        child: SizedBox(
                          height: 35,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Premium Service",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Icon(Icons.workspace_premium)
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 35,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Language",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(Icons.language)
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 35,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "License",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(Icons.text_snippet_rounded)
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: SizedBox(
                        height: 35,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Log out",
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(Icons.logout, size: 22, color: Colors.orange,)
                          ],
                        ),
                      ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 35,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delete account",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(Icons.delete_forever, color: Colors.red,)
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
      bottomNavigationBar: Navbar(navigationIndex: 3,),
    );
  }
}
