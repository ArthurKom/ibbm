import 'authentication/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'App Title',
    theme: ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue
        ),
    darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        ),
    themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}