import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:swipe_eat/eat_at_home_tag.dart';
import 'package:swipe_eat/login.dart';
import 'register_base.dart';
import 'tag_selection.dart';

class EatAtHomeCreatePage extends StatefulWidget {
  @override
  EatAtHomeCreateState createState() => EatAtHomeCreateState();
}

class EatAtHomeCreateState extends State<EatAtHomeCreatePage> {
  final List<bool> _selectedVisibility = <bool>[true, false];
  TextEditingController controller = TextEditingController();

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
                SizedBox(
                  height: 20.0,
                ),
                ToggleButtons(
                  direction: Axis.horizontal,
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedVisibility.length; i++) {
                        _selectedVisibility[i] = i == index;
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  constraints: BoxConstraints(
                    minHeight: 40.0,
                    minWidth: width / 2 - 22,
                  ),
                  isSelected: _selectedVisibility,
                  children: [
                    SizedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('Public'), SizedBox(width: 5,), Icon(Icons.language)])),
                    SizedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('Private'), SizedBox(width: 5,), Icon(Icons.visibility_off)])),
                  ],
                ),
                // public event?
                if (_selectedVisibility[0] == true) ...[
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 2),
                    child: const Text(
                      'Hint: The exact location of your event will not be publicly disclosed. '
                      'People can join your event without an invitation or event code, but can be removed anytime.',
                    ),
                  ),
                ],
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'Name',
                    suffixIcon: Icon(Icons.abc),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                    // control your hints text size
                    hintText: 'Description',
                    suffixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.none,
                  controller: controller,
                  onTap: () {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime.now(),
                        maxTime: DateTime.now().add(Duration(days: 365 * 2)),
                        onConfirm: (date) {
                          controller.text = DateFormat('yyyy-MM-dd | kk:mm').format(date);
                        },
                        currentTime: DateTime.now(),
                        locale: LocaleType.de);
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'Starting time',
                    suffixIcon: Icon(Icons.watch_later),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'City',
                    suffixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'Area code',
                    suffixIcon: Icon(Icons.numbers),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'Street and house number',
                    suffixIcon: Icon(Icons.house),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
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
                            child: Text("Cancel"))),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EatAtHomeTagPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 45),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            child: Text("Continue"))),
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
