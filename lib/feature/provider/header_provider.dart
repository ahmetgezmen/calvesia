import 'package:flutter/material.dart';

class HeaderProvider extends ChangeNotifier{
  String _headerText = "";

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

