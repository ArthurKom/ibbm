import 'package:flutter/material.dart';

class EventInvitePage extends StatefulWidget {
  List<String> options = [
    "Anton",
    "Berta",
    "Caesar"
  ];
  @override
  EventInviteState createState() => EventInviteState();
}

class EventInviteState extends State<EventInvitePage> {
  late TextEditingController contactTextController;
  String selectedContact = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                        'Invite',
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
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Invitation Code: ",
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      Text(
                        "ABCDEFG",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1.0,
                          endIndent: 5,
                        )
                      ),
                      Text(
                        "or",
                        style: TextStyle(
                          color: Colors.black26
                        ),
                      ),
                      Expanded(
                          child: Divider(
                            indent: 5,
                            thickness: 1.0,
                          )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                        child: Autocomplete<String>(
                          fieldViewBuilder: (BuildContext context,
                              TextEditingController textEditingController,
                              FocusNode focusNode,
                              VoidCallback onFieldSubmitted) {
                            contactTextController = textEditingController;
                            return TextField(
                              onSubmitted: (String value) {
                                onFieldSubmitted();
                              },
                              controller: textEditingController,
                              focusNode: focusNode,
                              decoration: InputDecoration(
                                isDense: true,
                                // important line
                                contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                // control your hints text size
                                hintText: "Contact",
                                suffixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            );
                          },
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text == '') {
                              return const Iterable<String>.empty();
                            }
                            return widget.options.where((String option) {
                              return option
                                  .toLowerCase()
                                  .contains(textEditingValue.text.toLowerCase());
                            });
                          },
                          onSelected: (String selection) {
                            selectedContact = selection;
                          },
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (selectedContact == "") {
                          } else {
                            setState(() {
                              contactTextController.clear();
                              selectedContact = "";
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 48),
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        child: Text("Invite")),
                  ]),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
