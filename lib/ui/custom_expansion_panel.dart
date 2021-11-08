import 'package:flutter/material.dart';
import 'package:flutter_balcoder_expansionpanel/model/expansion_panel_model.dart';

class CustomExpansionPanelPage extends StatefulWidget {
  CustomExpansionPanelPage({
    Key? key,
    required this.expansionList,
  }) : super(key: key);
  List<ExpansionPanelModel> expansionList;
  @override
  _CustomExpansionPanelPage createState() => _CustomExpansionPanelPage();
}

class _CustomExpansionPanelPage extends State<CustomExpansionPanelPage> {
  // List<ExpansionPanelModel> _expansionList = [];

  final _commentController = TextEditingController();

  final formKey = new GlobalKey<FormState>();
  final finalFormKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _commentController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: _controlItemListWidget(_height),
      ),
    );
  }

  Widget _controlItemListWidget(height) {
    return Container(
      height: height,
      child: ListView(
        children: [
          new Padding(
            padding: new EdgeInsets.all(12.0),
            child: new ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  widget.expansionList[index].isExpanded =
                      !widget.expansionList[index].isExpanded;
                });
              },
              children: widget.expansionList.map((ExpansionPanelModel item) {
                return new ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return new ListTile(
                          // onLongPress: () => _onWillLongPressed(item),
                          onTap: () {
                            // setState(() {
                            //   expansionList.forEach((element) {
                            //     element.isExpanded = false;
                            //   });

                            //   item.isExpanded = !item.isExpanded;
                            //   /*
                            //       TO DO : EXPLICAR QUE DEBE SELECCIONAR UNA OPCION
                            //        */
                            // });
                          },
                          leading: GestureDetector(
                            // onTap: () => setState(() {
                            //   item.isExpanded = !item.isExpanded;
                            //   /*
                            //       TO DO : EXPLICAR QUE DEBE SELECCIONAR UNA OPCION
                            //        */
                            // }),
                            child: Container(
                                height: 50,
                                child: item.isChecked
                                    ? new Radio(
                                        // value: item.isChecked,
                                        value: true,
                                        groupValue: item.isChecked,
                                        onChanged: (_) {},
                                      )
                                    : new Radio(
                                        value: false,
                                        groupValue: "test",
                                        onChanged: (_) {},
                                      )),
                          ),
                          // leading: new Checkbox(
                          //     value: item.isChecked,
                          //     onChanged: (bool value) {
                          //       setState(() {
                          //         item.isExpanded = !item.isExpanded;
                          //         /*
                          //         TO DO : EXPLICAR QUE DEBE SELECCIONAR UNA OPCION
                          //          */
                          //       });
                          //     }),
                          title: GestureDetector(
                            onTap: () => setState(() {
                              item.isExpanded = !item.isExpanded;
                              /*
                                  TO DO : EXPLICAR QUE DEBE SELECCIONAR UNA OPCION
                                   */
                            }),
                            child: new Row(
                              children: <Widget>[
                                new Expanded(child: new Text(item.title)),
                              ],
                            ),
                          ));
                    },
                    isExpanded: item.isExpanded,
                    body: new Container(
                      child: new Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          height: 72 * item.checkboxList.length.toDouble(),
                          child: new Column(
                            children: item.checkboxList.map((model) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: CheckboxListTile(
                                    title: ListTile(
                                      title: Text(model.value ?? '',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'OpenSans',
                                          )),
                                      dense: true,
                                      selected: true,
                                      autofocus: true,
                                    ),
                                    onChanged: (bool? value) {
                                      print(model.value);

                                      if (!item.isChecked) {
                                        setState(() {
                                          model.isChecked = value!;
                                          item.isChecked = value;
                                        });
                                        print(value);
                                      } else {
                                        setState(() {
                                          model.isChecked = value!;
                                          item.isChecked = value;
                                          for (var i = 0;
                                              i < item.checkboxList.length;
                                              i++) {
                                            if (item
                                                .checkboxList[i].isChecked!) {
                                              setState(() {
                                                item.isChecked = true;
                                              });
                                            }
                                          }
                                        });
                                      }
                                    },
                                    value: model.isChecked != null
                                        ? model.isChecked
                                        : false,
                                  ),
                                ),
                              );
                            }).toList(),
                          )),
                    ));
              }).toList(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
