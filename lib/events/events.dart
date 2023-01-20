import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swipe_eat/events/event_create.dart';
import 'event_join.dart';
import 'event_preview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../navigation_bar.dart';

class EventMenuModel {
  static List<Widget> globalEvents = [
    EventPreview(
      name: "Test",
      description: "This is my test description. Do you like it?",
      location: "Darmstadt",
      startTime: "16.01.2023 | 19:15",
      displayType: DisplayType.Joinable,
    ),
    EventPreview(
      name: "Test 2",
      description: "This is my second test description. Do you like it as well?",
      location: "Frankfurt",
      startTime: "20.02.2023 | 17:00",
      displayType: DisplayType.Joinable,
    ),
    EventPreview(
      name: "Test",
      description: "This is my test description. Do you like it?",
      location: "Darmstadt",
      startTime: "16.01.2023 | 19:15",
      displayType: DisplayType.Joinable,
    ),
    EventPreview(
      name: "Test 2",
      description: "This is my second test description. Do you like it as well?",
      location: "Frankfurt",
      startTime: "20.02.2023 | 17:00",
      displayType: DisplayType.Joinable,
    ),
    EventPreview(
      name: "Test",
      description: "This is my test description. Do you like it?",
      location: "Darmstadt",
      startTime: "16.01.2023 | 19:15",
      displayType: DisplayType.Joinable,
    ),
    EventPreview(
      name: "Test 2",
      description: "This is my second test description. Do you like it as well?",
      location: "Frankfurt",
      startTime: "20.02.2023 | 17:00",
      displayType: DisplayType.Joinable,
    ),
  ];

  static List<Widget> invitations = [
    EventPreview(
      name: "Test",
      description: "This is my test description. I am inviting you. Do you like it?",
      location: "Schustergasse 18, 64283 Darmstadt",
      startTime: "16.01.2023 | 19:15",
      organizer: "Tim",
      displayType: DisplayType.Invitation,
    ),
  ];

  static List<Widget> myEvents = [

  ];
}
