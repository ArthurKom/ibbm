import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
      title: 'App Title',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
          primarySwatch: Colors.blue
        /* dark theme settings */
      ),
      themeMode: ThemeMode.system,
      /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
      debugShowCheckedModeBanner: false,
      home:Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
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
                    Text('Login',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ],
                ),
                Divider(color: Theme.of(context).colorScheme.primary, thickness: 1,),
                SizedBox(height: 20.0,),
                TextField(
                  decoration: InputDecoration(
                    isDense: true, // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),// control your hints text size
                    hintText: 'Email',
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    isDense: true, // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),// control your hints text size
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Login'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 45),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            )
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                SizedBox(height:20.0),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Second()));
                  },
                  child:
                  Column(
                      children: <Widget>[
                        const Text(
                          'I don\'t have an account',
                          style: TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                      ]
                  ),
                ),
              ],
            ),
        ),
      ),
      ),
    );
  }
}

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

List<Widget> roles = <Widget>[
  SizedBox(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Person'),
            Icon(Icons.person)
          ]
      )
  ),
  SizedBox(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Restaurant'),
            Icon(Icons.food_bank)
          ]
      )
  ),
];

final ImagePicker _picker = ImagePicker();

/// Get from gallery
Future<File?> _getImageFromGallery() async {
  XFile? pickedFile = await _picker.pickImage(
    source: ImageSource.gallery,
  );
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  else {
    return null;
  }
}

class _SecondState extends State<Second> {
  final List<bool> _selectedUserRole = <bool>[true, false];
  File? pickedRestaurantImage;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
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
                    Text('Register',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
                  ],
                ),
                Divider(color: Theme.of(context).colorScheme.primary, thickness: 1,),
                SizedBox(height: 20.0,),
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
                SizedBox(height: 20.0,),
                TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    isDense: true, // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),// control your hints text size
                    hintText: 'Name',
                    suffixIcon: Icon(Icons.abc),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                if (_selectedUserRole[1] == true) ...[
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      isDense: true, // important line
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),// control your hints text size
                      hintText: 'Phone number',
                      suffixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextField(
                    decoration: InputDecoration(
                      isDense: true, // important line
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),// control your hints text size
                      hintText: 'City',
                      suffixIcon: Icon(Icons.location_city),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextField(
                    decoration: InputDecoration(
                      isDense: true, // important line
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),// control your hints text size
                      hintText: 'Street',
                      suffixIcon: Icon(Icons.house),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  TextField(
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      isDense: true, // important line
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),// control your hints text size
                      hintText: 'Website',
                      suffixIcon: Icon(Icons.language),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  GestureDetector(
                    onTap: () async {
                      File? file = await _getImageFromGallery();
                      if (file != null) {
                        setState(() {
                          pickedRestaurantImage = file;
                        });
                      }
                    },
                    child: SizedBox(
                        width: width - 42,
                        child:
                        Container(
                          height: pickedRestaurantImage != null ? null : 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black38,
                                  width: 1,
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 12, 0),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Picture (tap to change)",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Icon(Icons.image,
                                        color: Colors.black54,
                                        size: 20,)
                                      ]
                                  ),
                                ),
                                SizedBox(
                                  height: pickedRestaurantImage != null ? 8 : 10,
                                ),
                                if (pickedRestaurantImage != null) ...[
                                  Divider(
                                    height: 2,
                                    color: Colors.black38,
                                    thickness: 2,
                                  ),
                                ],
                                Container(
                                    child: pickedRestaurantImage != null ?
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(10)
                                      ),
                                      child: Image.file(
                                        pickedRestaurantImage!,
                                          fit: BoxFit.cover
                                      ),
                                    ) :
                                        Container()
                                  //Icon(Icons.photo),
                                )
                              ],
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 20.0,),
                ],
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    isDense: true, // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),// control your hints text size
                    hintText: 'Email',
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    isDense: true, // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),// control your hints text size
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    isDense: true, // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),// control your hints text size
                    hintText: 'Confirm Password',
                    suffixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Register'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 45),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            )
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                SizedBox(height:20.0),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Myapp()));
                  },
                  child:
                  Column(
                      children: <Widget>[
                        const Text(
                          'I already have an account',
                          style: TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                      ]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}