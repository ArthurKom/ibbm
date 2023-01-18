import 'package:flutter/material.dart';
import 'login.dart';
import 'register_success.dart';
import 'register_restaurant_general.dart';

class RegisterBasePage extends StatefulWidget {
  @override
  RegisterBaseState createState() => RegisterBaseState();
}

List<Widget> roles = <Widget>[
  SizedBox(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Person'), SizedBox(width: 5,), Icon(Icons.person)])),
  SizedBox(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Restaurant'), SizedBox(width: 5,), Icon(Icons.food_bank)])),
];

class RegisterBaseState extends State<RegisterBasePage> {
  final List<bool> _selectedUserRole = <bool>[true, false];

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
                      'Registration',
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
                      for (int i = 0; i < _selectedUserRole.length; i++) {
                        _selectedUserRole[i] = i == index;
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  constraints: BoxConstraints(
                    minHeight: 40.0,
                    minWidth: width / 2 - 22,
                  ),
                  isSelected: _selectedUserRole,
                  children: roles,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.name,
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'Email',
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'Confirm Password',
                    suffixIcon: Icon(Icons.lock_outline),
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
                              // restaurant
                              if (_selectedUserRole[1] == true) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterRestaurantGeneralPage()));
                              }
                              // user
                              else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterSuccessPage()));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 45),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            child: Text(_selectedUserRole[1] == true
                                ? 'Next'
                                : 'Register'))),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Column(children: <Widget>[
                    const Text(
                      'I already have an account',
                      style: TextStyle(
                        color: Colors.indigo,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}