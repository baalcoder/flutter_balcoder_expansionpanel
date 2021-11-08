class ExpansionPanelModel {
  String? key;
  bool isExpanded;
  bool isChecked;
  String title;
  List<CheckboxCustomModel> checkboxList;

  ExpansionPanelModel({
    required this.isExpanded,
    required this.isChecked,
    required this.title,
    required this.checkboxList,
  });

  toJson() {
    List aux = [];

    checkboxList.forEach((element) {
      if (element != null) {
        aux.add(element.toJson());
      }
    });

    return {
      "isChecked": isChecked,
      "title": title,
      "checkboxList": aux,
    };
  }

  factory ExpansionPanelModel.fromJson(parsedJson) {
    List<CheckboxCustomModel> aux = [];

    parsedJson['checkboxList'].forEach((element) {
      aux.add(new CheckboxCustomModel(
          value: element['value'], isChecked: element['isChecked']));
    });

    return ExpansionPanelModel(
        isExpanded: false,
        isChecked: parsedJson['isChecked'],
        title: parsedJson['title'],
        checkboxList: aux);
  }
}

class CheckboxCustomModel {
  String? value;
  bool? isChecked;

  CheckboxCustomModel({
    this.value,
    this.isChecked,
  });

  CheckboxCustomModel.map(dynamic obj) {
    this.value = obj['value'];
    this.isChecked = obj['isCheckboxChecked'];
  }

  toJson() {
    return {
      "value": value,
      "isCheckboxChecked": isChecked,
    };
  }
}
