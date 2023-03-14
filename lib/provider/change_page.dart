import 'package:flutter/material.dart';

class ChangePage with ChangeNotifier {
  int pageIndex = 0;

  void changePage(int index) {
    pageIndex = index;
    notifyListeners();
  }
}
