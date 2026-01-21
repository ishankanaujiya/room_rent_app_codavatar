import 'package:flutter/material.dart';

class CircularLoadingProvider extends ChangeNotifier
{
  bool isLoading = false;

  changeLoadingStatus(bool loadingStatus) async
  {
    isLoading = loadingStatus;
    notifyListeners();

  }
}