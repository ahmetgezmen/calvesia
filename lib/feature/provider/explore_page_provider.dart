import 'package:flutter/material.dart';

import '../../Utils/Style/color_palette.dart';

class ExploreProvider extends ChangeNotifier {
  String _fetchSwitch = "Standart";

  final List _category = [
    {
      "name": "Parti",
      "color": BaseColorPalet.partyColor,
      "tag": 'party',
      "visibility" : true
    },
    {
      "name": "Kariyer",
      "color": BaseColorPalet.careerColor,
      "tag": 'career',
      "visibility" : true
    },
    {
      "name": "Sağlık",
      "color": BaseColorPalet.healthColor,
      "tag": 'health',
      "visibility" : true
    },
    {
      "name": "Eğitim",
      "color": BaseColorPalet.educationColor,
      "tag": 'education',
      "visibility" : true
    }
  ];

  getCategory() {
    return _category;
  }

  getFetchSwitch() {
    return _fetchSwitch;
  }

  disableAllButton(){
    for (var element in _category) {element["visibility"] = true;}
    _fetchSwitch='Standart';
    notifyListeners();
  }

  selectButton(value){
    for (var element in _category) {if(value!=element["tag"]){ element["visibility"] = false; } }
    _fetchSwitch = value;
    notifyListeners();
  }

}
