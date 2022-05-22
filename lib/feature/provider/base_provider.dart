import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier{

  bool _isShowNavigationButton = true;

  void isShowNavigationButtonFunk() {
    _isShowNavigationButton == true
        ? _isShowNavigationButton = false
        : _isShowNavigationButton = true;
    notifyListeners();
  }

  get isShowNavigationButton => _isShowNavigationButton;

}

