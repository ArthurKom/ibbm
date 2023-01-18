import 'package:flutter/material.dart';
import 'package:swipe_eat/events/event_invitations.dart';
import 'package:swipe_eat/events/event_list.dart';
import 'events/event_search.dart';

class Navbar extends StatefulWidget {
  int navigationIndex;

  Navbar({required this.navigationIndex}) : super(key: null);

  @override
  State<StatefulWidget> createState() => NavbarState();
}

class NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          if (index == 0) {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => EventSearchPage())
            );
          }
          else if (index == 1) {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => MyEventPage())
            );
          }
          else if (index == 2) {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => EventInvitationsPage())
            );
          }
          else if (index == 3) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EventSearchPage())
            );
          }
        });
      },
      currentIndex: widget.navigationIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_note),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.email),
          label: 'Invitations',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
