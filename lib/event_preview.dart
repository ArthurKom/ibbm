import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';

class EventPreview extends StatefulWidget {
  final String name;
  final String description;
  final String startTime;
  final String location;
  final String organizer;
  final bool isInvitation;

  const EventPreview({required this.name, required this.description,
    required this.startTime, required this.location,
    this.organizer = "", this.isInvitation = false }) : super(key: null);

  @override
  State<StatefulWidget> createState() => EventPreviewState();
}

class EventPreviewState extends State<EventPreview> {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints(minHeight: 50),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.black54),
        ),
        child: Column(
          children: [
            Text(
              widget.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.black54,
              thickness: 1,
            ),
            if (widget.description != "") ...[
              Container(
                padding: EdgeInsets.only(left: 2),
                alignment: Alignment.centerLeft,
                child: ExpandableText(
                  widget.description,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                  trimType: TrimType.lines,
                  trim: 2, // trims if text exceeds more than 2 lines
                ),
              ),
              SizedBox(height: 5,),
            ],
            if (widget.organizer != "") ...[
              SizedBox(height: 5,),
              Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10,),
                  Flexible(
                    child: Text(
                      widget.organizer,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14
                      ),
                    ),
                  ),
                ],
              ),
            ],
            SizedBox(height: 5,),
            Row(
              children: [
                Icon(Icons.watch_later),
                SizedBox(width: 10,),
                Flexible(
                  child: Text(
                    widget.startTime,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Icon(Icons.location_pin),
                SizedBox(width: 10,),
                Flexible(
                  child: Text(
                    widget.location,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                  ),
                ),
              ],
            ),
            if (widget.isInvitation) ...[
              Divider(
                color: Colors.black54,
                thickness: 1,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {

                      },
                      child: Row(
                        children: [
                          Icon(Icons.check, color: Colors.green),
                          SizedBox(width: 5,),
                          Text("Accept"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {

                      },
                      child: Row(
                        children: [
                          Icon(Icons.close, color: Colors.red,),
                          SizedBox(width: 5,),
                          Text("Decline"),
                        ],
                      )
                    ),
                  ],
                ),
              )
            ],
          ],
        )
      );
  }
}
