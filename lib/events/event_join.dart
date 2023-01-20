import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:swipe_eat/events/event_search.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;

  const ShadowContainer({required Key key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
            spreadRadius: 1.0,
            offset: Offset(
              4.0,
              4.0,
            ),
          )
        ],
      ),
      child: child,
    );
  }
}



class JoinGroup extends StatefulWidget {

  JoinGroup();
  @override
  _JoinGroupState createState() => _JoinGroupState();
}

class _JoinGroupState extends State<JoinGroup> {
  void _joinGroup(BuildContext context, String groupId) async {
  }

  TextEditingController _groupIdController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Key keyparam = const Key("value");

    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[BackButton()],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Join Event',
                style: TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(
            color: Theme.of(context).colorScheme.primary,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              key: keyparam,
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      // important line
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      // control your hints text size
                      hintText: 'Invitation Code',
                      suffixIcon: Icon(Icons.abc),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EventSearchPage()));
                              },
                              child: const Text('Join'),
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
                  )
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}