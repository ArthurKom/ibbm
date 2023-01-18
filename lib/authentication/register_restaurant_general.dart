import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'register_base.dart';
import 'register_restaurant_tag.dart';

class RegisterRestaurantGeneralPage extends StatefulWidget {
  @override
  RegisterRestaurantGeneralState createState() =>
      RegisterRestaurantGeneralState();
}

final ImagePicker _picker = ImagePicker();

/// Get from gallery
Future<File?> _getImageFromGallery() async {
  XFile? pickedFile = await _picker.pickImage(
    source: ImageSource.gallery,
  );
  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null;
  }
}

class RegisterRestaurantGeneralState
    extends State<RegisterRestaurantGeneralPage> {
  File? pickedRestaurantImage;

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
                      'Registration - Restaurant',
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
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'Phone number',
                    suffixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    isDense: true,
                    // important line
                    contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    // control your hints text size
                    hintText: 'Website URL',
                    suffixIcon: Icon(Icons.language),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
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
                      child: Container(
                          height: pickedRestaurantImage != null ? null : 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black38,
                                width: 1,
                              )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 0, 12, 0),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Picture (tap to change)",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Icon(
                                        Icons.image,
                                        color: Colors.black54,
                                        size: 20,
                                      )
                                    ]),
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
                                  child: pickedRestaurantImage != null
                                      ? ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(10)),
                                    child: Image.file(
                                        pickedRestaurantImage!,
                                        fit: BoxFit.cover),
                                  )
                                      : Container()
                                //Icon(Icons.photo),
                              )
                            ],
                          ))),
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
                                      builder: (context) =>
                                          RegisterBasePage()));
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 45),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            child: Text("Back"))),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RegisterRestaurantTagPage()));
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 45),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            child: Text("Next"))),
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