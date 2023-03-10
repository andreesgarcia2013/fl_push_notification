import 'package:flutter/material.dart';
import 'package:notifications_app/screens/screens.dart';
import 'package:notifications_app/services/push_notifications.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotification.initializaApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey=new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey=new GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PushNotification.messagesStream.listen((message) {
      print('MyApp: $message');
      navigatorKey.currentState?.pushNamed('message', arguments:message);
      final snackbar=SnackBar(content: Text('$message'),);
      messengerKey.currentState?.showSnackBar(snackbar);
     });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey:navigatorKey ,
      scaffoldMessengerKey: messengerKey,
      routes: {
        'home':(_) => HomeScreen(),
        'message':(context) => MessageScreen()
      },
    );
  }
}