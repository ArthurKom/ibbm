import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';

class FoodTagSelection extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => FoodTagSelectionState();
}

class FoodTagSelectionState extends State<FoodTagSelection> {
  Map<String, Widget> foodTags = {
    "Vegetarian" : Icon(Icons.grass),
    "Vegan" : Icon(Icons.nature),
    "Italian" : Icon(Icons.local_pizza)
  };

  @override
  Widget build(BuildContext context) {
    return Selection(
      hintText: "Tag",
      options: foodTags,
      icon: Icons.tag,
    );
  }
}


class Selection extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final Map<String, Widget> options;

  Selection({required this.hintText,
  required this.icon, required this.options}) : super(key: null);

  @override
  State<StatefulWidget> createState() => SelectionState();
}

class SelectionState extends State<Selection> {
  String selectedTag = "";
  late TextEditingController tagTextController;
  final List<Widget> selectedTags = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(20),
        constraints: BoxConstraints(minHeight: 50),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.black54),
        ),
        child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: selectedTags.isNotEmpty
                ? selectedTags
                : [Text("No tags selected.")]),
      ),
      SizedBox(
        height: 10.0,
      ),
      Row(children: [
        Expanded(
            child: Autocomplete<String>(
          fieldViewBuilder: (BuildContext context,
              TextEditingController textEditingController,
              FocusNode focusNode,
              VoidCallback onFieldSubmitted) {
            tagTextController = textEditingController;
            return TextField(
              onSubmitted: (String value) {
                onFieldSubmitted();
              },
              controller: textEditingController,
              focusNode: focusNode,
              decoration: InputDecoration(
                isDense: true,
                // important line
                contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                // control your hints text size
                hintText: widget.hintText,
                suffixIcon: Icon(Icons.tag),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            );
          },
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return const Iterable<String>.empty();
            }
            return widget.options.keys.where((String option) {
              return option
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            selectedTag = selection;
          },
          /*optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<String> onSelected, Iterable<String> tags)
          {
            return Column(
              children: [
                for (var tag in tags) Text(tag)
              ],
            );
          }*/
        )),
        SizedBox(
          width: 5,
        ),
        ElevatedButton(
            onPressed: () {
              if (selectedTag == "") {
              } else {
                setState(() {
                  selectedTags.add(Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.options.containsKey(selectedTag)) ...[
                            widget.options[selectedTag]!,
                          ],
                          Text(selectedTag, textScaleFactor: 1.2),
                          Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 25,
                          )
                        ],
                      )));
                  tagTextController.clear();
                  selectedTag = "";
                });
              }
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(100, 48),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            child: Text("Add")),
      ]),
    ]);
  }
}
