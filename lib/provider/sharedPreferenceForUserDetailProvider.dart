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
        print("The User Full Name is: $_userEmail");
        print("The User Full Name is: $_userPhoneNumber");
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
        var pref = await SharedPreferences.getInstance();
      
        await pref.setString(KeyForSharedPreference.KEYFORFULLNAME, fullName);
       
        await pref.setString(KeyForSharedPreference.KEYFOREMAIL, userEmail);
       
        await pref.setString(KeyForSharedPreference.KEYFORPHONENUMBER, userPhoneNumber);
  
        print("Value Stored");
        notifyListeners();
      }
      catch(e)
      {
        print("Value Not Stored: ${e.toString()}");
      }
    
    }

}