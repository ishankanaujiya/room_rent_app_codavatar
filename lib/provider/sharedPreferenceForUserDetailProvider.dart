import 'package:flutter/material.dart';
import 'package:room_rent_app/util/keyForSharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceForUserDetailProvider extends ChangeNotifier
{
  String _userFullName = "";
  String _userEmail = "";
  String _userPhoneNumber = "";

  String get getUserFullName => _userFullName;
  String get getUserEmail => _userEmail;
  String get getUserPhoneNumber => _userPhoneNumber;

    getStoredUserDetail() async
    {
       try
      {
        var pref = await SharedPreferences.getInstance();
        _userFullName = await pref.getString(KeyForSharedPreference.KEYFORFULLNAME) ?? ""; 
        _userEmail = await pref.getString(KeyForSharedPreference.KEYFOREMAIL) ?? ""; 
        _userPhoneNumber = await pref.getString(KeyForSharedPreference.KEYFORPHONENUMBER) ?? ""; 
        print("The User Full Name is: $_userFullName");
        notifyListeners();
      }
      catch(e)
      {
        print("Value Not Stored: ${e.toString()}");
      }
      
    }

    storeUserDetail(String fullName, String userEmail, String userPhoneNumber) async
    {
      try
      {
        print("The Name is: $fullName");
        var pref = await SharedPreferences.getInstance();
        print("The Name1 is: $fullName");
        await pref.setString(KeyForSharedPreference.KEYFORFULLNAME, fullName);
        print("The Name2 is: $fullName");
        await pref.setString(KeyForSharedPreference.KEYFOREMAIL, userEmail);
        print("The Name3 is: $fullName");
        await pref.setString(KeyForSharedPreference.KEYFORPHONENUMBER, userPhoneNumber);
        print("The Name4 is: $fullName");
        print("Value Stored");
      }
      catch(e)
      {
        print("Value Not Stored: ${e.toString()}");
      }
    
    }

}