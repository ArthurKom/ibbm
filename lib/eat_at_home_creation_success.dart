import 'package:flutter/material.dart';
import 'login.dart';

class EatAtHomeCreationSuccessPage extends StatefulWidget {
  @override
  EatAtHomeCreationSuccessState createState() => EatAtHomeCreationSuccessState();
}

class EatAtHomeCreationSuccessState extends State<EatAtHomeCreationSuccessPage> {
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
                      'Event creation successful',
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
                    "On the next page you can invite people to your"
                    " event or alternatively look up and then share your event"
                    " code so they can attend. If your event is public, people"
                    " can attend without your invitation or event code."),
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
                                      builder: (context) => LoginPage()));
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
    );
  }
}