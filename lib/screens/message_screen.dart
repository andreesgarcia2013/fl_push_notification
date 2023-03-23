import 'package:flutter/material.dart';
import 'package:notifications_app/services/push_notifications.dart';
import 'package:provider/provider.dart';

import '../providers/noti_screen.dart';

class MessageScreen extends StatefulWidget {

  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  // late final openScreen;
  @override
  Widget build(BuildContext context) {
    // final openScreen=Provider.of<NotiScreen>(context, listen: false);
    // print('La pantalla ${openScreen.notiScreen}');
    print('Entraste a message Screen ${NotiScreen.isScreenOpen}');
    final args=ModalRoute.of(context)?.settings.arguments??'No Data';
    return  Scaffold(
      body: Center(
         child: Text('$args'),
      ),
    );
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   if (MessageScreen.isScreenOpen==true) {
  //     Navigator.pop(context);
  //     Navigator.of(context).pushNamed('message');
  //   }
  // }

  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // final openScreen=Provider.of<NotiScreen>(context, listen: false);
    // openScreen.notiScreen=false;
    // print(openScreen.notiScreen);
    print('cerrando ventana');
    NotiScreen.isScreenOpen = false;
  }

  void _configureDeepLink() {
    // Configuramos el handler para cuando la app es abierta a través del deep link
    // Ejecutamos la acción adecuada en función del enlace que se reciba
    
    print('Ejecutamos la acción adecuada en función del enlace que se reciba');
    PushNotification.messagesStream.listen((deeplink) {
      if (deeplink == 'message') {
        print('recibe noti');
        print(ModalRoute.of(context)?.settings.name);
        // Si la pantalla a la que queremos ir ya está en la cima del stack, llamamos a onNewIntent
        if (ModalRoute.of(context)?.settings.name == 'message') {
          setState(() {
            print('Ya estas en la pagina');
          // Actualizamos el estado de la pantalla con los nuevos datos
          // No importa si la pantalla ya está abierta o no
          // Simplemente actualizamos el estado y Flutter se encarga de repintar la pantalla
          });
        } else {
          // Si no, navegamos a la pantalla utilizando el Navigator
          Navigator.of(context).pushNamed('message');
        }
      }
    });
  }
}