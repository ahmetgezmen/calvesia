import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier{

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