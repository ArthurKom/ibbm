import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MatchResultPage extends StatefulWidget {
  @override
  MatchResultState createState() => MatchResultState();
}

class MatchResultState extends State<MatchResultPage> {

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
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Best Match',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                  thickness: 1,
                ),*/
                SizedBox(
                  height: 20.0,
                ),
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
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'Example Restaurant',
                                    style: TextStyle(
                                        fontSize: 21.0, fontWeight: FontWeight.bold),
                                  ),
                                )
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
                            height: 5,
                          ),
                          Container(
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                // implement image
                                child: Image(
                                  image: AssetImage('assets/Restaurant.jpeg'),
                                  fit: BoxFit.scaleDown,
                                )
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Divider(
                              color: Colors.blue,
                              thickness: 1,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.language),
                                    SizedBox(width: 10,),
                                    InkWell(
                                      child: Flexible(
                                        child: Text("https://www.restaurant-website.de",
                                          textScaleFactor: 1.2,
                                          style: TextStyle(
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrlString('https://www.restaurant-website.de')
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
                                SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(width: 10,),
                                    InkWell(
                                      child: Flexible(
                                        child: Text("099 12345678",
                                          textScaleFactor: 1.2,
                                          style: TextStyle(
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrlString('tel://09912345678')
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.email),
                                    SizedBox(width: 10,),
                                    InkWell(
                                      child: Flexible(
                                        child: Text("test@restaurant.de",
                                          textScaleFactor: 1.2,
                                          style: TextStyle(
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ),
                                      onTap: () => launchUrlString('mailto://test@restaurant.de')
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
                  height: 0.0,
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
                        child: const Text('Finish'),
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
