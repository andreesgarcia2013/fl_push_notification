import 'package:flutter/material.dart';

class MessageScreenObserver extends NavigatorObserver {
  static final MessageScreenObserver instance = MessageScreenObserver();

  bool isMessageScreenOpen = false;

  @override
  void didPush(Route route, Route? previousRoute) {
    if (route.settings.name == '/message_screen') {
      isMessageScreenOpen = true;
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (route.settings.name == '/message_screen') {
      isMessageScreenOpen = false;
    }
  }
}