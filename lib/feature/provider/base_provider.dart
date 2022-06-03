import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier{

  String _typeShowNavigationButton = "base";

  void setShowNavigationButtonFunkProfile() {
    _typeShowNavigationButton = "profile";
    notifyListeners();
  }
  void setShowNavigationButtonFunkBase() {
    _typeShowNavigationButton = "base";
    notifyListeners();
  }
  void setShowNavigationButtonFunkPostShow() {
    _typeShowNavigationButton = "postShow";
    notifyListeners();
  }

  get getShowNavigationButton => _typeShowNavigationButton;

}

