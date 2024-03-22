import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier{
  int selectedIndex = 0;

  void setIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

}