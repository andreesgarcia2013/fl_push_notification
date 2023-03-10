// SHA1:  A6:A0:EC:3A:CF:7D:6C:FA:B9:96:4B:57:F1:04:0B:3C:F1:A5:81:77

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification {
  static FirebaseMessaging messaging= FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream=new StreamController.broadcast();
  static Stream<String> get messagesStream=>_messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async{
    print('BackgroundHandle ${message.messageId}' );
    _messageStream.add(message.data['product']??'No data');
  }

  static Future _onMessageHandler(RemoteMessage message) async{
    print('onMessage handler ${message.messageId}' );
    print(message.data);
    _messageStream.add(message.data['product']??'No data');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async{
    print('BackgroundHandle ${message.messageId}' );
    _messageStream.add(message.data['product']??'No data');
  }

  static Future initializaApp()async{
    //Push
    await Firebase.initializeApp();
    token=await FirebaseMessaging.instance.getToken();
    print(token);

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }
  static closeStreams(){
    _messageStream.close();
  }
}