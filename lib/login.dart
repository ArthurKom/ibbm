import 'package:flutter/material.dart';
import 'package:swipe_eat/eat_at_home_create.dart';
import 'register_base.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  bool _rememberMe = false;

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
                      'Login',
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
                TextField(
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
                  height: 15.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    _rememberMe = value;
                                  });
                                }
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _rememberMe = !_rememberMe;
                              });
                            },
                            child: Text("Remember me"),
                          )
                        ],
                      ),
                      const Text(
                        'I forgot my password',
                        style: TextStyle(
                          color: Colors.indigo,
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 11.5,
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
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 45),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                        )
                      )
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterBasePage()));
                  },
                  child: Column(children: <Widget>[
                    const Text(
                      'I don\'t have an account',
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
