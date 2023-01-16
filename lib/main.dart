import 'package:swipe_eat/event_view.dart';
import 'package:swipe_eat/match_result.dart';

import 'login.dart';
import 'eat_at_home_create.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'App Title',
    theme: ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue
        /* light theme settings */
        ),
    darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        /* dark theme settings */
        ),
    themeMode: ThemeMode.system,
    /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}