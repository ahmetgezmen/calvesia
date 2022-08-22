import 'package:flutter/material.dart';

class HeaderViewmodel extends ChangeNotifier{
  String _headerText = "";
  int _selectedIndex = 0;

  setSelectedIndex(int val){
    _selectedIndex = val;
    notifyListeners();
  }

  get getSelectedIndex => _selectedIndex;

  void updateHeaderText(String value) {
    _headerText = value;
    notifyListeners();
  }
  void clearHeaderText(){
    _headerText="";
    notifyListeners();
  }

  get getHeaderText => _headerText;

}

