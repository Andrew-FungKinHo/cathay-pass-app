import 'package:cathay_pass_app/models/flightinfo.dart';
import 'package:flutter/material.dart';

class SelectionProvider extends ChangeNotifier {
  void changeFlightSelection(List<FlightInfo> flightList, int index) {
    flightList.forEach((element) {
      element.selected = false;
    });
    flightList[index].selected = true;
    notifyListeners();
  }

  bool getSelected(List<FlightInfo> flightList, int index) {
    return flightList[index].selected;
  }
}
