import 'package:flutter/material.dart';

class MenuAppController extends ChangeNotifier {
  // Other properties and methods in MenuAppController

  Map<String, int> statistics = {
    'totalUsers': 0,
    'maleUsers': 0,
    'femaleUsers': 0,
    'otherGenderUsers': 0,
    'pwdYesUsers': 0,
  };

  void updateStatistics(Map<String, int> newStatistics) {
    statistics = newStatistics;
    notifyListeners(); // Notify listeners about the change in statistics
  }
}
