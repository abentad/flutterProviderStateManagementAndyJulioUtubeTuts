import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
//   //will create a variable that will hold what the units and wax lines are

  String _units;
  List<String> _waxLines;

//   //this is like init state for this class also called constructor

  //will instantiate this variables with these values and loadsprefs when this class is created
  //in the main.dart myApp
  SettingsProvider() {
//     //assigns imperial as default for _units and also assigns a default value for waxlines

    _units = 'Imperial';
    _waxLines = ['Swix', 'Toko'];
    loadPreferences();
  }

  //Getters
//   //this is the way others get the values of this variables

  String get units => _units;
  List<String> get waxLines => _waxLines;

  //Setters
//   //this is the way others set the values of this variables

  void setUnits(String units) {
    _units = units;
    //     //this line will notify all widgets that "_units" has been assigned ->
//     // <- a new value from the "units" variable its like setState but for all widgets
    notifyListeners();
    savePreferences();
  }

  void _setWaxLines(List<String> waxLines) {
    _waxLines = waxLines;
    notifyListeners();
  }

//   //will add waxLine to the _waxLines

  void addWaxLine(String waxLine) {
    if (_waxLines.contains(waxLine) == false) {
      _waxLines.add(waxLine);
      notifyListeners();
      savePreferences();
    }
    //for debug
    print("added $waxLine");
    print(_waxLines);
  }

//   //will remove waxLine from the _waxLines

  void removeWaxLine(String waxLine) {
    if (_waxLines.contains(waxLine) == true) {
      _waxLines.remove(waxLine);
      notifyListeners();
      savePreferences();
    }
    //for debug
    print("removed $waxLine");
    print(_waxLines);
  }

  savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('units', _units);
    prefs.setStringList('waxLines', _waxLines);
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String units = prefs.getString('units');
    List<String> waxLines = prefs.getStringList('waxLines');

    if (units != null) setUnits(units);
    if (waxLines != null) _setWaxLines(waxLines);
  }
}
