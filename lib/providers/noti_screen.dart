import 'package:flutter/material.dart';

class NotiScreen extends ChangeNotifier {
  static bool isScreenOpen = false;
  bool _notiScreen=false;

  bool get notiScreen=>_notiScreen;

  set notiScreen(bool value){
    _notiScreen=value;
  }
}