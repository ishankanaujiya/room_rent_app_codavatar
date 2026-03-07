import 'package:flutter/cupertino.dart';

class FilterPostProvider extends ChangeNotifier
{
  String _selectedDistrictForSearch = "Kathmandu";

  String get getSelectedDistrict => _selectedDistrictForSearch;

  changeSelectedDistrict(String changedDistrict)
  {
    print("The value is changed");

    _selectedDistrictForSearch = changedDistrict;
    notifyListeners();
  }

}