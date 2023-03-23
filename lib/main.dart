import 'package:flutter/material.dart';
import 'package:notifications_app/providers/noti_screen.dart';
import 'package:notifications_app/screens/screens.dart';
import 'package:notifications_app/services/message_screen_observer.dart';
import 'package:notifications_app/services/push_notifications.dart';
import 'package:notifications_app/widgets/message_notification.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotification.initializaApp();

  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NotiScreen(),)
    ],
    child: MyApp()));
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
      // messengerKey.currentState?.showMaterialBanner( MaterialBanner(
      //       content: Text('This is a MaterialBanner'),
      //       actions: <Widget>[
      //         TextButton(
      //           onPressed: () {
      //             final openScreen=Provider.of<NotiScreen>(context, listen: false);
      //             print(openScreen.notiScreen);
      //             if (openScreen.notiScreen==true) {
      //               print('no abres nada');
      //               return;
      //             }
      //             else{
      //               openScreen.notiScreen=true;
      //               print(openScreen.notiScreen);
      //               navigatorKey.currentState?.pushNamed('message', arguments:message);                  }
      //           },
      //           child: Text('Go'),
      //         ),
      //       ],
      //     ),);
      showOverlayNotification((context) => MessageNotification(onReplay: () {  }, action:message), duration: Duration(seconds: 5));
     });
  }
  

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        navigatorObservers: [MessageScreenObserver.instance],
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        navigatorKey:navigatorKey ,
        scaffoldMessengerKey: messengerKey,
        routes: {
          'home':(_) => HomeScreen(),
          'message':(context) => MessageScreen()
        },
      ),
    );
  }
}


// navigatorKey.currentState?.pushNamed('message', arguments:message);
      // final snackbar=SnackBar(content: Text('$message'),);
      // messengerKey.currentState?.showSnackBar(snackbar);
      // showSimpleNotification(Text('Notificacion con el producto $mesxsage'));

    //   Recibo mis notificaciones de la siguiente forma PushNotification.messagesStream.listen((message) {
    //   print('MyApp: $message');
    //   showOverlayNotification((context) => MessageNotification(onReplay: () {  }, action:message), duration: Duration(seconds: 5));
    //  });
    //  el widget de MessageNotification al presionar 
    //  class MessageNotification extends StatelessWidget {
    //   Widget build(BuildContext context) {
    //  GestureDetector(
    //   onTap: () async {
    //     OverlaySupportEntry.of(context)?.dismiss();
    //     Navigator.of(context).push(MaterialPageRoute(builder: (_) => MessageScreen()));
    //   },
    //  )}
    //   sin embargo cuando ya me encuentro en MessageScreen y aparece la notificacion vuelve a abrir una pantalla MessageScreen
    //   cuando no deberia ya que estoy en la misma.