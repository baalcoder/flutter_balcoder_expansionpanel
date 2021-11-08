import 'package:flutter/material.dart';
import 'package:flutter_balcoder_expansionpanel/model/expansion_panel_model.dart';
import 'package:flutter_balcoder_expansionpanel/ui/custom_expansion_panel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expansion Panel Balcoder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomExpansionPanelPage(
        categoryList: [
          new ExpansionPanelModel(
            isExpanded: true,
            isChecked: true,
            title: "TITLE",
            checkboxList: [
              new CheckboxCustomModel(
                  value: 'TEST CHECKBOX 1.1', isChecked: false),
              new CheckboxCustomModel(
                  value: 'TEST CHECKBOX 1.2', isChecked: true)
            ],
          ),
          new ExpansionPanelModel(
            isExpanded: false,
            isChecked: false,
            title: "TITLE 2",
            checkboxList: [
              new CheckboxCustomModel(
                  value: 'TEST CHECKBOX 2.1', isChecked: false),
              new CheckboxCustomModel(
                  value: 'TEST CHECKBOX 2.2', isChecked: false)
            ],
          )
        ],
      ),
    );
  }
}
